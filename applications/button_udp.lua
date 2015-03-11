-- Copyright (c) 2015 by Geekscape Pty. Ltd.  Licence LGPL V3.
--
-- Execute via the Skeleton framework
--
-- init.lua:   app = require("button_udp")
-- config.lua: module.UDP_HOST = UDP_SERVER_IP_ADDRESS
-- config.lua: module.UDP_PORT = 4000

local module = {}

local PIN_BUTTON = 3   -- GPIO0
local TIME_ALARM = 25  -- 0.025 second, 40 Hz

local button_state = 1
local button_time  = 0

gpio.mode(PIN_BUTTON, gpio.INPUT, gpio.PULLUP)  -- GPIO0

local function buttonHandler()
  button_state_new = gpio.read(PIN_BUTTON)

  if button_state == 1 and button_state_new == 0 then
    button_time = tmr.time()
    socket:send("button pressed\n")
  elseif button_state == 0 and button_state_new == 1 then
    button_time_new = tmr.time()
    socket:send("button released\n")
    if tmr.time() > (button_time + 2) then  -- press at least 2 seconds
      tmr.stop(1)
      socket:close()
    end
  end

  button_state = button_state_new
end

function module.start()
  print("button_udp")

  socket = net.createConnection(net.UDP, 0)
  socket:connect(config.UDP_PORT, config.UDP_HOST)

  tmr.alarm(1, TIME_ALARM, 1, buttonHandler)
end

return module
