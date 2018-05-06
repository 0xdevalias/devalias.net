---
layout: post
title: "WIP: Reverse Engineering USB"
tags:
- linkdump
- research
- reverse-engineering
- hardware
- hardware-hacking
- diy
- usb
- iot
categories:
- devalias
disqus: true
webmention: true
crosspost_to_medium: false
---
I tend to dive down rabbit holes a lot, and given the cost of context switching and memory deteriorating over time, sometimes the state I build up in my mind gets lost between the chances I get to dive in. These 'linkdump' posts are an attempt to collate at least some of that state in a way that I can hopefully restore to my brain at a later point.

This time around I was inspired to look into USB reverse engineering, protocol analyis, and what would be involved in implementing custom drivers for arbitrary hardware. Or put another way: how do I hack all of the USBs?!??

## Intro to USB

USB (universal serial bus) is an industry standard covering cables, connectors and protocols; and is pretty ubiquitous among tech products these days. I won't get deep on describing all of the facts, since that's what Wikipedia is good at:

* https://en.wikipedia.org/wiki/USB

That said, it will be useful to understand some of the aspects of how USB devices and protocols are laid out, and some of the terminology used.

A [USB system](https://en.wikipedia.org/wiki/USB#System_design) ([ref2](https://www.linuxvoice.com/drive-it-yourself-usb-car-6/)) has:

* A **host**, with one or more downstream ports, and multiple peripherals
* **Hubs** may be included, allowing up to 5 tiers
* A host may have multiple controllers, each with one or more ports
* Up to 127 devices can be connected to a single host controller
* A **device** may have several logical sub-devices, referred to as 'device functions'
* A **composite device** may provide multiple functions (eg. webcam + microphone)
* A **compound device** connects logical devices to a built in hub

Digging into the protocol/communication side of things:

* Communication is based on **pipes** (logical channels), between the host and an endpoint (logical entity) on a device
* A device can have up to 32 endpoints (16 IN, 16 OUT)
* Endpoints are defined and numbered during initialization, so tend to remain fairly permanent, whereas a pipe may be opened/closed
* Two types of pipe: **stream** and **message**
* **Message pipes** are bi-directional, used for control transfers short, simple commands + status response
* **Stream pipes** are uni-directional, transfers data in isochronous, interrupt or bulk transfer
* A set of endpoints with associated metadata is also known as an interface, each is associated with a single device function
* All USB devices have at least one endpoint (0), default, used for control transfers. Descriptors sent on default pipe can describe other endpoints.
* Descriptors form a hierarchy that you can view with tools like `lsusb`.
* Device descriptor: contains information like device Vendor ID (VID) and Product ID (PID)

There are different transport types that can be used:

* **Interrupt transfers** are for short periodic real-time data exchanges.
* **Isochronous transfers** are somewhat similar but less strict; they allow for larger data blocks and are used by web cameras and similar devices, where delays or even losses of a single frame are not crucial.
* **Bulk transfers** are for large amounts of data.
* **Control transfer type** is the only one that has a standardised request (and response) format, and is used to manage devices

**Further reading:**

* http://www.beyondlogic.org/usbnutshell
* https://www.linuxvoice.com/drive-it-yourself-usb-car-6/

## USB Reverse Engineering: An Introduction

Now, I could probably go through and right a whole blog post on this.. but, other people have done it for me! The following walks through an introduction to interfacing with, reverse engineering, understanding, and ultimately implementing software to drive a USB remote control car.

* https://www.linuxvoice.com/drive-it-yourself-usb-car-6/ (2015)
* https://github.com/vsinitsyn/usbcar.py

I found it quite easy to consume, and doesn't really assume much in the way of prior knowledge.

One of the tools used above was [`lsusb`](https://linux.die.net/man/8/lsusb): a utility for displaying information about USB buses in the system and the devices connected to them. Among other things, this allows the vendor and ID of the device to be identified. Once identified, this tag can be used to query further information about the device, eg. `lsusb -vd 0a81:0702`.

Other relevant tools/concepts used include:

* `usbmon`: a facility in kernel which is
used to collect traces of I/O on the USB bus
* [Wireshark](https://wiki.wireshark.org/CaptureSetup/USB)
* [PyUSB](https://github.com/pyusb/pyusb) : USB access for Python
* [libusb](https://github.com/libusb/libusb) : A cross-platform library to access USB devices

## USB Reverse Engineering: Further Reading

TODO: full end2end walkthroughs/tutorials/etc (eg. hackaday, adafruit, etc)

TODO: Order these by year, maybe separate our some standouts?

Another method of reverse engineering could be to reverse the device driver itself, and understand it's functionality/features from that.

* https://github.com/openrazer/openrazer/wiki/Reverse-Engineering-USB-Protocol (2017)
* https://learn.adafruit.com/hacking-the-kinect (2012, 2015?)
* https://www.linuxvoice.com/drive-it-yourself-usb-car-6/ (2015)
* https://www.mattcutts.com/blog/reverse-engineering-a-windows-usb-driver/ (2013)
* https://hackaday.com/2009/08/20/reverse-engineering-usb-drivers/ (2009)
  * http://www.jespersaur.com/drupal/book/export/html/21
  * http://devdriven.com/2008/12/luxeed-led-keyboard-driver-for-linux/
  * https://github.com/kstephens/luxeed

## Software: Wireshark, usbmon, USBPcap, VirtualBox, etc

TODO

TODO: virtualbox/VM software for capture

* Software Capture/Driver dev..
  * https://wiki.wireshark.org/CaptureSetup/USB
  * http://desowin.org/usbpcap/ ([GitHub](https://github.com/desowin/usbpcap))
    * USB packet capture for Windows

      * [Virtual USB Analyzer](https://github.com/scanlime/vusb-analyzer)
    * http://vusb-analyzer.sourceforge.net/
* https://github.com/wcooley/usbrevue : USBREVue is a suite of tools for reverse-engineering USB devices.

http://benoit.papillault.free.fr/usbsnoop/doc.en.php

http://www.linux-usb.org/USBMon/
https://www.hhdsoftware.com/usb-monitor (win)

TODO: ?Software: Older Methods?: usbsnoopy, etc? maybe just combine this with the above?

* https://linuxtv.org/wiki/index.php/Usbsnoop
* https://linuxtv.org/wiki/index.php/Usbreplay

## Hardware: GoodFET, GreatFET, Facedancer, OpenVizsla, etc

TODO

* http://greatscottgadgets.com/greatfet/
    * https://github.com/greatscottgadgets/greatfet : GreatFET firmware and host software
    * https://github.com/greatscottgadgets/greatfet-hardware : like GoodFET but greater
  * http://goodfet.sourceforge.net/
    * https://github.com/travisgoodspeed/goodfet
  * https://github.com/ktemkin/facedancer : FaceDancer boards are simple hardware devices that act as "remote-controlled" USB controllers. With the proper software, you can use these boards to quickly and easily emulate USB devices-- and to fuzz USB host controllers!
    * http://travisgoodspeed.blogspot.com.au/2012/07/emulating-usb-devices-with-python.html
    * https://github.com/dominicgs/USBProxy : A proxy for USB devices, libUSB and gadgetFS
      * Replaced by facedancer: https://github.com/ktemkin/facedancer#usbproxy-nouveau-and-protocol-analysis
    * http://rmspeers.com/archives/252 : Scapy Support for USB Protocol on Facedancer Boards, MAX2420, etc.
    * http://goodfet.sourceforge.net/orders/
      * "PCBs for the GoodFET32, GoodFET42, GoodThopter11, Facedancer11, and Facedancer21 are available by sending USD $5 per board to sixtysixav at hotmail.com."
      * https://int3.cc/products/facedancer21
      * https://www.adafruit.com/product/1279 (Goodfet42)
    * https://github.com/dominicgs/BeagleDancer : A Facedancer21 expansion board for the BeagleBone.

  * https://hackaday.com/2013/07/02/usb-sniffing-with-the-beagleboard-xm/
    * https://github.com/matlo/bb_usb_sniffer
    * https://blog.gimx.fr/a-beagleboard-xm-based-usb-sniffer/
    * https://www.elinux.org/BeagleBoard/GSoC/2010_Projects/USBSniffer
      * https://beagleboard.org/p/drinkcat-myopenid-com/usb-sniffer-ba62d2

* https://github.com/matlo/serialusb : A cheap USB proxy for input devices

* http://openvizsla.org/ ([GitHub](https://github.com/openvizsla/ov_ftdi))
    * Open Hardware FPGA-based USB analyzer
    * https://www.kickstarter.com/projects/bushing/openvizsla-open-source-usb-protocol-analyzer

## Commercial: TotalPhase BeagleUSB

TODO: Commercial device, various models from cheapish to super expensive, different capabilities based on USB speed, etc

* https://www.totalphase.com/products/beagle-usb12/
    * https://www.totalphase.com/support/articles/200800983-Beagle-USB-12-Protocol-Analyzer-Quick-Start-Guide
    * https://www.adafruit.com/product/708 $399.95
  * https://www.totalphase.com/products/beagle-usb480/ ~$1400, USB 2
  * https://www.totalphase.com/products/beagle-usb5000-v2-standard/ ~$3420, USB 3
  * https://www.totalphase.com/products/beagle-usb5000-v2-ultimate/ ~$5700, USB 2/3

## ?Code/Drivers/etc?

TODO: libusb, pyusb, etc

* https://github.com/pyusb/pyusb : USB access for Python

* http://libusb.info/ ([GitHub](https://github.com/libusb/libusb))
    * A cross-platform library to access USB devices
  * https://sourceforge.net/projects/libusbk/
  * https://github.com/LibUsbDotNet/LibUsbDotNet
  * https://github.com/daynix/UsbDk

* http://www.fourwalledcubicle.com/LUFA.php
    * https://github.com/abcminiuser/lufa : LUFA - the Lightweight USB Framework for AVRs.

* https://github.com/makestuff/libfpgalink
    * https://github.com/makestuff/libfpgalink/wiki/FPGALink

TODO: ?Custom Drivers?, windows driver kit, rust drivers, etc.. maybe combine this with the above..

* Driver development
  * [Windows Driver Kit (WDK)](https://docs.microsoft.com/en-us/windows-hardware/drivers/ddi/content/index)
  * https://github.com/pravic/winapi-kmd-rs : Windows Kernel-Mode Drivers written in Rust
  * http://www.linuxvoice.com/be-a-kernel-hacker/

## Device Emulation, USB over IP, etc

Now that you've figured out all of the intricacies of the device, understand it's protocol and wrote some software (or even a driver) to interface with it.. what about the other side of things?

* Can we emulate the device in software (for testing, or other purposes)
* Can we take the information from that device and stream it somewhere remotely?
* Can we make a new hardware device that 'presents itself' as the device we just looked at? (eg. to interface with existing drivers/software)

This is where device emulation and USB over IP can come to the party. I haven't dug too deeply into this topic, but a well placed Google search or two (`github usb over ip`, `github usb emulation`) turned up some interesting looking resources (and I'm sure there are far more out there..):

* [forensix/libusbip](https://github.com/forensix/libusbip) : USB over IP
* [vavrusa/libusbnet](https://github.com/vavrusa/libusbnet) :
libusb wrapper to enable communication with USB devices over TCP/IP
* [Frazew/PythonUSBIP](https://github.com/Frazew/PythonUSBIP) : USBIP protocol fully implemented in python + Full wiimote support using cwiid
* [lcgamboa/USBIP-Virtual-USB-Device](https://github.com/lcgamboa/USBIP-Virtual-USB-Device) :
Emulates USB Devices using USBIP in Python or c
* [Microsoft/UDE](https://github.com/Microsoft/UDE) : USB Device Emulation Samples
* [EngineerTony/Arduino_USBKeyboard_Hacker](https://github.com/EngineerTony/Arduino_USBKeyboard_Hacker) : Uses the Arduino Uno microcontroller to emulate a USB keyboard and insert random text into the computer at random intervals
* [ViGEm/ViGEmBus](https://github.com/ViGEm/ViGEmBus) : Windows kernel-mode driver emulating well-known USB game controllers

Definitely an area that could be interesting to explore deeper, maybe in a future project/post.

## IoT, Hardware Hacking, Fuzzing, etc

Once we understand the language these devices speak, how to listen to it, how to emulate it.. what's next? One idea is to apply the concept of fuzzing used in the software world (random/crafted data used to look for crashes in software), and turn it to hardware. And with the prevalence of IoT devices out there now (often with woeful security).. this could be another interesting rabbithole to explore (google: `usb hardware fuzzing`):

* https://blog.quarkslab.com/usb-fuzzing-basics-from-fuzzing-to-bug-reporting.html (2014)
* [nccgroup/FrisbeeLite](https://github.com/nccgroup/FrisbeeLite) : A GUI-based USB device fuzzer
  * https://www.nccgroup.trust/au/our-research/fuzzing-usb-devices-using-frisbee-lite/ (2013)
* [ollseg/usb-device-fuzzing](https://github.com/ollseg/usb-device-fuzzing) :
Some tools for testing USB devices (2012)
* https://labs.mwrinfosecurity.com/blog/usb-fuzzing-for-the-masses/ (2011)
* https://wikileaks.org/hbgary-emails//fileid/64995/17596 : USB Protocol Fuzzer Options (2009)
* https://www.beyondsecurity.com/bestorm.html (commercial)
  * https://www.beyondsecurity.com/bestorm_usb_case_study.html

## Link Dump

Now that we've got all of that out of the way, here's whats left of my link dump that didn't end up being categorised elsewhere:

* TODO
* https://electronics.stackexchange.com/questions/4180/reverse-engineering-usb-signals

## Conclusion


