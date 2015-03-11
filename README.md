# ESP8266 NodeMCU Examples

## Table of contents

* [ESP8266 NodeMCU Firmware](#esp8266-nodemcu-firmware)
* [License](#license)

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

## License

The NodeMCU ESP8266 workshop documentation by
[Geekscape Pty. Ltd.](http://geekscape.org)
is licensed under a
[Creative Commons Attribution-NonCommercial 4.0 International License](http://creativecommons.org/licenses/by-nc/4.0)
based on a work at
[https://github.com/geekscape/nodemcu_esp8266](https://github.com/geekscape/nodemcu_esp8266)

The NodeMCU ESP8266 workshop software and examples by
[Geekscape Pty. Ltd.](http://geekscape.org)
is licensed under the
[GNU LGPL V3 License](https://www.gnu.org/licenses/lgpl.html)

If these licenses prevent you from utilizing these materials, please
[contact me](https://github.com/geekscape/nodemcu_esp8266/issues/new).
