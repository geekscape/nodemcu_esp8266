# ESP8266 NodeMCU Examples

## Table of contents

* [ESP8266 NodeMCU Firmware](#esp8266-nodemcu-firmware)

## ESP8266 NodeMCU Firmware

Download this version of the [NodeMCU firmware development branch](firmware)
built on 2015-02-28 with __WS2812B RGB LED support__.

Install on your ESP8266 using
[esptool](https://github.com/themadinventor/esptool)
(or similar) as follows ...

      esptool.py -p $SERIAL_PORT write_flash 0x00000 nodemcu_dev_0x00000.bin 0x10000 nodemcu_dev_0x10000.bin

Standard pre-built versions of the
[NodeMCU firmware master branch](https://github.com/nodemcu/nodemcu-firmware)
can be found over
[here](https://github.com/nodemcu/nodemcu-firmware/tree/master/pre_build).
