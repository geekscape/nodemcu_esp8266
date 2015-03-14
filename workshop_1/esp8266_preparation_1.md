Preparation instructions for the first workshop
-----------------------------------------------
If you have signed up
[(at the meet-up page)](http://www.meetup.com/Connected-Community-HackerSpace-Melbourne/events/220681609/)
for the ESP8266 workshop this Wednesday 2015-03-11 at the Melbourne HackerSpace
then there is some preparation that is strongly recommended to get the best
outcome from the workshop.

The workshop will start *promptly* at 7 pm and run till around 9:30 pm.

During the workshop, feel free to follow the
__[Workshop 1 presentation](esp8266_workshop_1.pdf)__ at your own pace.
Lots of copy/paste instructions contained within !

Hardware required
-----------------
* Either an ESP-01 (2x GPIOs available) or an ESP-12 evaluation board
  (9x GPIOs, LEDs, ADC and Light Dependent Resistor) ...

  * [TronixLabs ESP-01](http://tronixlabs.com/iot/wifi-serial-transceiver-module-with-esp8266)
  * [TronixLabs ESP-12 evaluation board](http://tronixlabs.com/wireless/esp8266/esp8266-esp-12-full-evaluation-board)

  If you pick-up an ESP-12 evaluation board, bring along 3x AA batteries.

  You will also need a cable to connect your ESP-01 or ESP-12 to a USB
   serial adaptor (see below).

* USB serial adaptor with 3.3V Rx/Tx serial signals,
  if you don't have one already, then either of these will do ...

  * [TronixLabs Freetronics Vcc 3.3V](http://tronixlabs.com/usb-serial/freetronics-usbserial-adapter)
  ... the nice thing about the Freetronics adapter is that it provides
(switchable) 3.3V on the Vcc output pin.
  * [TronixLabs Vcc: Unknown](http://tronixlabs.com/usb-serial/ftdi-basic-breakout-5v-3-3v-micro-usb)
  * [TronixLbs Vcc: 5V](http://tronixlabs.com/beaglebone/cable/usb-to-ttl-serial-cable)
  ... some 3.3V I/O USB serial adaptors simply provide the USB 5V rail,
which will __kill your ESP8266__ ... make sure you double-check
Vcc is 3.3V before connecting.  If you have a 5V Vcc USB serial
adaptor, then you will need to provide 3.3V by using a regulator
(3.3V LDO).

* Some type of button, anything will do (even just pressing two wires
  together !), e.g
 [TronixLabs mini push button pack](http://tronixlabs.com/components/buttons/mini-push-button-tactile-switch-20-pack)

* An LED (with current limiting resistor) and/or WS2812B RGB LEDs

* Have some approach to connecting the button and LEDs to the ESP-01 or
  ESP-12.  Usually, some jumper wires will do, e.g
  [TronixLabs jumper wire pack](http://tronixlabs.com/hardware/wires/jumper/breadboard-jumper-wire-pack-200mm-100mm)
  Perhaps you prefer a bread-board or
  just hand-build a little cable from miscellaneous bits.

ESP-01 cable
------------
The ESP8266 is a 3.3V device and there is no power regulator on the ESP-01.
Make sure that your USB serial adaptor is providing 3.3V on the Vcc output,
before connecting directly to the ESP-01.

If you have a Vcc 3.3V USB serial adaptor (like the Freetronics one) ...
you can directly connect the pins, which is much easier, as follows ...

![Picture of ESP-01 cable](http://benlo.com/esp8266/esp8266-reflash-firmware.jpg)
_(image from benlo.com)_

Here is a schematic for how to connect a 5V USB serial adaptor to your ESP-01
  
![Schematic for connecting 5V USB serial adaptor to ESP-01](http://rayshobby.net/wordpress/wp-content/uploads/2014/10/esp8266_conn.png)
_(schematic from rayshobby.net)_

For the ESP-01 to function, you need to provide power, serial Rx/Tx,
connect chip enable (CH_PD) to high and also be able to hold GPIO0 low
on power-up for firmware programming.

     ESP-01        USB serial adaptor
     1 RXD    <--  TXD
     2 VCC    ---  VCC  3.3V
     3 GPIO0  ---  Be able to connect to GND during power-up to flash firmware
     4 RESET  ---  VCC 3.3V
     5 GPIO2
     6 CH_PD  ---  VCC 3.3V
     7 GND    ---  GND
     8 TXD    -->  RXD

Jumper wires will do, but for something more permanent I used ribbon
cable, .1" male/female headers and hot-glue 

ESP-12 evaluation board cable
-----------------------------
Connecting your ESP-12 evaluation board to a USB serial adaptor is
straight-forward.  Since the 3x AA batteries provide the power ... only
three jumper wires are required, i.e ground, serial receive, serial
transmit.

On the ESP-12 evaluation board, there is a 3-pin male header.  The pin
functions are written in white letters on the PCB, in the order ... RXD,
GND, TXD.  Unfortunately, the labels do not correctly indicate the direction
of data-flow into and out of the ESP-12 evaluation board.
Please connect as follows ...

      ESP-12    USB serial adaptor
      TXD  <--  TXD
      GND  ---  GND
      RXD  -->  RXD

Jumper wires will do, but for something more permanent I used ribbon
cable, .1" male/female headers and hot-glue 

The ESP-12 evaluation board already holds the ESP8266 chip enable
(CH_PD) pin permanently high ... and provides a header jumper for
enabling the bootloader for firmware flashing (GPIO0 held low during
power on).

Software installation (please do NOT wait till the workshop)
------------------------------------------------------------
Downloading and installation is time-consuming, especially if several people
are doing this at the same time at the workshop.  Best done before-hand.

Often, using serial devices can be a problem.
Please try and get this sorted before the workshop.

- esptool (used to install ESP8266 firmware) along with Python and PySerial
  - [esptool GitHub](https://github.com/themadinventor/esptool)
  - [PySerial](http://pyserial.sourceforge.net)
     - esptool appears to be incompatible with Python 3.4
     - On Windows, Python 2.7 64-bit package is incompatible with pyserial

- ESPlorer (ESP8266 IDE for NodeMCU) and Java run-time
  - [ESPlorer home page](http://esp8266.ru/esplorer)
  - [ESPlorer download](https://java.com/en/download)

MQTT overview
-------------
In case you've never heard of MQTT, this will take just a few minutes to
read ...

- [MQTT Introduction](http://everywarecloud.eurotech.com/doc/ECDevGuide/latest/3.01-MQTT-Intro.asp)

NodeMCU functionality
---------------------
This is completely optional ... and just a heads-up in case you can't
wait.  These topics will be well-covered during the workshop.

The workshop will focus on using NodeMCU, which is Lua scripting
invoking ESP8266 SDK functionality.  You don't need to know much Lua,
e.g variables, simple control-flow and defining / invoking a function.

Have a quick look at the sections on features, example code, loops,
function.  Do not worry about meta-tables, object-oriented programming,
internals.

   - [Wikipedia Lua](http://en.wikipedia.org/wiki/Lua_%28programming_language%29#Features)

Skim this page to get an idea of the ESP8266 functionality available via
NodeMCU ...

   - [NodeMCU API documentation](https://github.com/nodemcu/nodemcu-firmware/wiki/nodemcu_api_en)

Other resources
---------------
- [General information @ Nurdspace](https://nurdspace.nl/ESP8266)
- [ESP8266 community forums](http://www.esp8266.com)
