local module = {}

local function wifi_wait_ip()
  if wifi.sta.getip() then 
    tmr.stop(1)
--  print("wifi ready: " .. wifi.sta.getip())
    app.start()
  end 
end

local function wifi_start(aps)
  for key,value in pairs(aps) do
    if config.SSID and config.SSID[key] then
--    print("wifi AP: " .. key .. ": " .. value)
      wifi.setmode(wifi.STATION);
      wifi.sta.config(key, config.SSID[key])
      wifi.sta.connect()
      config.SSID = nil  -- more secure and save memory
      tmr.alarm(1, 2500, 1, wifi_wait_ip)
    end
  end
end

function module.start()
  wifi.sta.getap(wifi_start)
end

return module
