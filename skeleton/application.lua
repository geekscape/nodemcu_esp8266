-- Copyright (c) 2015 by Geekscape Pty. Ltd.  Licence LGPL V3.

local module = {}

function module.start()
  print("application start")
  print("IP address: " .. wifi.sta.getip())

--socket = net.createConnection(net.UDP, 0)
--socket:connect(config.PORT, config.HOST)
end

return module
