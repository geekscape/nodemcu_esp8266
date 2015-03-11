# ESP8266 NodeMCU Workshops: Examples, framework and applications

## Table of contents

* [Overview](#overview)
* [Workshops](#workshops)
* [Standalone examples](#standalone-examples)
* [Skeleton framework](#skeleton-framework)
* [Applications](#applications)
* [ESP8266 NodeMCU Firmware](#esp8266-nodemcu-firmware)
* [License](#license)

## Overview

This repository supports a series of
[ESP8266](https://espressif.com/en/products/esp8266/)
workshops focused on [NodeMCU](https://github.com/nodemcu/nodemcu-firmware),
first run at the
[Connected Community HackerSpace (Melbourne)](http://hackmelbourne.org) on
[Wednesday 2015-01-15](http://www.meetup.com/Connected-Community-HackerSpace-Melbourne/events/220681609/).

The [Skeleton framework](#skeleton) for developing networked NodeMCU modules
and [associated application examples](#applications)
are generally useful beyond the workshops.

## Workshops

Each workshop consists of preparation recommendations and a presentation.

* [Workshop 1](workshop_1): Introduction to ESP8266 and NodeMCU
* __FUTURE__ Workshop 2: ESP8266 NodeMCU applications
* __FUTURE__ Workshop 3: ESP8266 native C applications

## Standalone examples

These simple [examples](examples) are used in [Workshop 1](workshop_1)
to demonstrate basic NodeMCU functionality for attaching a button, LED
or WS2812B RGB LEDs to an ESP8266.  These examples don't use the network.

## Skeleton framework

The [Skeleton framework](skeleton) is a small collection of Lua modules
that provide a simple modular approach to developing NodeMCU ESP8266
applications.

The Skeleton framework looks after setting up the Wi-Fi network in a location
independent fashion and separates configuration from application code.
The Skeleton framework also supports developing code first as source files,
then using node.compile() for production (saving valuable heap memory).

Use of the Skeleton framework is introduced in [Workshop 1](workshop_1).

## Applications

The [applications](applications) are Lua modules that rely
on the Skeleton framework to look after configuration and Wi-Fi set-up.
Each individual application can focus on the specific functionality
without having to duplicate basic infrastructure over and over again.

Some of the applications are introduced in [Workshop 1](workshop_1).

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
