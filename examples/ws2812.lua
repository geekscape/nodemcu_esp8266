-- Copyright (c) 2015 by Geekscape Pty. Ltd.  Licence LGPL V3.
--
-- http://www.esp8266.com/viewtopic.php?f=21&t=1143

BRIGHT     = 0.1
ON         = BRIGHT * 255
BUTTON_PIN = 3       -- GPIO0
LED_PIN    = 4       -- GPIO2
PIXELS     = 8
TIME_ALARM = 25      -- 0.025 second, 40 Hz
TIME_SLOW  = 500000  -- 0.500 second,  2 Hz

RED   = string.char( 0, ON,  0)
GREEN = string.char(ON,  0,  0)
BLUE  = string.char( 0,  0, ON)
WHITE = string.char(ON, ON, ON)
BLACK = string.char( 0,  0,  0)

gpio.mode(BUTTON_PIN, gpio.INPUT, gpio.PULLUP)

function colourWheel(index)
  if index < 85 then
    return string.char(index * 3 * BRIGHT, (255 - index * 3) * BRIGHT, 0)
  elseif index < 170 then
    index = index - 85
    return string.char((255 - index * 3) * BRIGHT, 0, index * 3 * BRIGHT)
  else
    index = index - 170
    return string.char(0, index * 3 * BRIGHT, (255 - index * 3) * BRIGHT)
  end
end

rainbow_speed = 8

function rainbow(index)
  buffer = ""
  for pixel = 0, 7 do
    buffer = buffer .. colourWheel((index + pixel * rainbow_speed) % 256)
  end
  return buffer
end

if true then
  ws2812.write(LED_PIN, RED:rep(PIXELS))
  tmr.delay(TIME_SLOW)
  ws2812.write(LED_PIN, GREEN:rep(PIXELS))
  tmr.delay(TIME_SLOW)
  ws2812.write(LED_PIN, BLUE:rep(PIXELS))
  tmr.delay(TIME_SLOW)
  ws2812.write(LED_PIN, WHITE:rep(PIXELS))
  tmr.delay(TIME_SLOW)
  ws2812.write(LED_PIN, BLACK:rep(PIXELS))
end

rainbow_index = 0

function rainbowHandler()
  if gpio.read(BUTTON_PIN) == 1 then
    ws2812.write(LED_PIN, rainbow(rainbow_index))
    rainbow_index = (rainbow_index + 1) % 256
  else
    tmr.stop(1)
    print("rainbowHandler: EXIT");
  end
end

tmr.alarm(1, TIME_ALARM, 1, rainbowHandler)
