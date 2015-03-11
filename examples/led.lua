-- ESP-12 dev board RGB LED GPIOs
RED_LED_PIN   = 8
GREEN_LED_PIN = 6
BLUE_LED_PIN  = 7

LED_PIN    = 4    -- GPIO2
TIME_ALARM = 500  -- 0.5 second

gpio.mode(LED_PIN, gpio.OUTPUT)

led_state = gpio.LOW

function ledHandler()
  if led_state == gpio.LOW then
    led_state = gpio.HIGH
  else
    led_state = gpio.LOW
  end

  gpio.write(LED_PIN, led_state)
end

tmr.alarm(1, TIME_ALARM, 1, ledHandler)
