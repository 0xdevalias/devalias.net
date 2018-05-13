---
layout: post
title: "WIP: USB Reverse Engineering: Down the rabbit hole"
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

This time around I was inspired to look into USB reverse engineering, protocol analyis, hardware hacking, and what would be involved in implementing custom drivers for arbitrary hardware. Or put another way: how do I hack all of the USBs?!??

It seems the further I went, the more and more interesting I found the content I was finding. Hopefully it will help to shortcut your own journey down this path, and enlighten you to a whole area of new and interesting things to hack!

## tl;dr

This is long, and has many options, and time is precious:

* **Walkthrough:** Read the [adafruit one](https://learn.adafruit.com/hacking-the-kinect)
* **Software:** Wireshark + usbpcap/usbmon
* **Hardware:** GreatFET, Facedancer 2.0
* **Commercial Hardware:** BeagleUSB

## Intro to USB

USB (universal serial bus) is an industry standard covering cables, connectors and protocols; and is pretty ubiquitous among tech products these days. I won't get deep on describing all of the facts, since that's what Wikipedia is good at:

* https://en.wikipedia.org/wiki/USB

That said, it will be useful to understand some of the aspects of how USB devices and protocols are laid out, and some of the terminology used.

A [USB system](https://en.wikipedia.org/wiki/USB#System_design) ([see also](https://www.linuxvoice.com/drive-it-yourself-usb-car-6/)) has:

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
* [Jan Axelson's USB Complete books](http://janaxelson.com/)

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

The following are some additional relatively short reads on how other have approached reverse engineering some devices, including tools they used, and basic methodologies.

I would definitely suggest checking this one out first:

* https://learn.adafruit.com/hacking-the-kinect (2012, 2015?)

By this stage you're probably not going to pack up masses of new information, but here are the rest for completeness, just in case:

* https://github.com/openrazer/openrazer/wiki/Reverse-Engineering-USB-Protocol (2017)
* https://www.linuxvoice.com/drive-it-yourself-usb-car-6/ (2015)
* https://www.mattcutts.com/blog/reverse-engineering-a-windows-usb-driver/ (2013)
* https://hackaday.com/2009/08/20/reverse-engineering-usb-drivers/ (2009)
  * http://www.jespersaur.com/drupal/book/export/html/21
  * http://devdriven.com/2008/12/luxeed-led-keyboard-driver-for-linux/
  * https://github.com/kstephens/luxeed

Some common tools/methods used in the above articles include:

* Explore / Capture
  * `lsusb -vv` (*nix) ([ref](https://linux.die.net/man/8/lsusb)) / `system_profiler SPUSBDataType` (macOS) / [USBDeview](http://www.nirsoft.net/utils/usb_devices_view.html) (Windows)
  * `usbmon` / USBsnoop / SnoopyPro
  * [Beagle480 / Beagle Data Center Software](https://www.totalphase.com/products/beagle-usb480/)
  * Virtualbox / KVM / QEMU
  * Wireshark
* Interact
  * libusb / libusb-win32
  * pyUSB

The basic process seems to be:

* Setup to capture the device
* Identify the Vendor ID and Product ID
* Determine the device descriptors / endpoints
* Capture USB traffic / attempt to decode commands
* Make a driver / program to interact
* At this stage, you may fuzz for other commands as well (generally safer to do read only)

Another method of reverse engineering could be to reverse the device driver itself, and understand the functionality/features from that. This takes a more 'traditional' software reverse engineering approach to solving the problem. If you want to be completely thorough, a hybrid approach may make the most sense (eg. analyse the traffic on from the device itself, then use the existing driver to help understand the data being sent back/forth and/or confirm you have captured all of the features)

## Software: Wireshark, usbmon, USBPcap, VirtualBox, etc

So as we learned in the above articles, there are a number of 'software only' methods we can use to capture/inspect USB traffic, with the main modern methods being:

* [WireShark](https://wiki.wireshark.org/CaptureSetup/USB)
* [USBpcap](http://desowin.org/usbpcap/) ([GitHub](https://github.com/desowin/usbpcap)
* [usbmon](https://www.kernel.org/doc/Documentation/usb/usbmon.txt)

It is also possible to 'pass through' USB devices with your favourite virtual machine software (VMware, Parallels, Virtualbox, KVM, QEMU, etc) to assist in capturing data, though I will leave it as an exercise to the reader to look up the specifics (some references are in the above walkthroughs).

There are also some older programs and methods that might still work, but probably aren't ideal anymore, including:

* [USBREVue](https://github.com/wcooley/usbrevue): USBREVue is a suite of tools for reverse-engineering USB devices.
* [Virtual USB Analyzer](https://github.com/scanlime/vusb-analyzer) ([old site](http://vusb-analyzer.sourceforge.net/))
* [USB Snoopy](http://web.archive.org/web/20010429043148/http://www.jps.net/koma/)
* usbsnoop ([1](http://benoit.papillault.free.fr/usbsnoop/doc.en.php), [2](https://linuxtv.org/wiki/index.php/Usbsnoop), [3](https://sourceforge.net/projects/usbsnoop/))
* [usbreplay](https://linuxtv.org/wiki/index.php/Usbreplay)
* [SniffUSB](https://web.archive.org/web/20151218000528/http://www.pcausa.com/Utilities/UsbSnoop/default.htm)
* [USB Monitor](https://www.hhdsoftware.com/usb-monitor) (Windows)

## Hardware: tl;dr

Too many choices? Don't want to read through them all? A good bet is probably:

* **Right Now:** GreatFET, Facedancer 2.0
* **Commercial:** BeagleUSB

## Hardware: BeagleBoard-XM / USBSniffer (~2010-2013, ~$149+)

Based on a [2010 GSoC BeagleBoard USB Sniffer](https://www.elinux.org/BeagleBoard/GSoC/2010_Projects/USBSniffer), this is an updated version of a [BeagleBoard-XM](http://beagleboard.org/beagleboard-xm) based USB sniffer. It acts as a man-in-the-middle hardware proxy allowing USB traffic to be captured, and later viewed in Wireshark or similar.

* https://blog.gimx.fr/a-beagleboard-xm-based-usb-sniffer/
* https://github.com/matlo/bb_usb_sniffer
* https://www.elinux.org/BeagleBoard/GSoC/2010_Projects/USBSniffer
* https://hackaday.com/2013/07/02/usb-sniffing-with-the-beagleboard-xm/

## Hardware: OpenVizsla (~2010-2014)

> OpenVizsla is a Open Hardware FPGA-based USB analyzer. Unlike other similar devices on the market, hardware design files are available as well as full source code for the firmware and client software of the device.

This was a [Kickstarter Project](https://www.kickstarter.com/projects/bushing/openvizsla-open-source-usb-protocol-analyzer) to create an "Open Hardware FPGA-based USB analyzer" targeting **USB 2.0 High-Speed**. There seems to be a lot of mixed opinions/views about this project on the internet/forums calling scam and similar. It sounds like there were a lot of delays and other issues.

According to [this blog post](http://debugmo.de/2014/05/ov3-hardware/), it sounds like they eventually got something working (years later) under the moniker 'OV3'. There seem to be a number of related posts on this blog [under the tag 'OpenVizsla'](http://debugmo.de/tags/OpenVizsla/):

* http://debugmo.de/2014/05/ov3-hardware/
* http://debugmo.de/2014/08/ov3-fpga-design/
* http://debugmo.de/2014/09/ov3-fpga-helloworld/

You should be able to find the latest news and code on the following website/GitHub pages:

* http://openvizsla.org/
* [GitHub](https://github.com/openvizsla/ov_ftdi)
* https://twitter.com/openvizsla (no tweets)
* https://twitter.com/hashtag/openvizsla (no activity since 2010)
* https://www.kickstarter.com/projects/bushing/openvizsla-open-source-usb-protocol-analyzer/updates

## Hardware: SerialUSB / GIMX USB Adapter (~2015, ~US$5-35)

> A cheap USB proxy for input devices.

SerialUSB is at the low end of hardware capture devices, designed to be a low cost solution to assist in adding support for USB gaming peripheral protocols to the [GIMX](http://blog.gimx.fr/) project.

* http://blog.gimx.fr/serialusb/
* https://github.com/matlo/serialusb (~US$5)
* https://blog.gimx.fr/product/gimx-adapter/ (~US$35)
* http://gimx.fr/wiki/index.php?title=DIY_USB_adapter
* https://hackaday.com/2015/12/23/usb-proxy-rats-out-your-devices-secrets/

For most purposes we probably won't need hardware for things at this level.. the software-based capture devices are likely good enough. But who knows.. maybe there are other uses for super cheap hardware capture..

## Hardware: GoodFET (~2009-2018+, ~US$50)

(Before I dive in too deeply.. if you want the latest/greatest in this space, check out the GreatFET.)

> The GoodFET is an open-source JTAG adapter, loosely based upon the TI MSP430 FET UIF and EZ430U boards, as described in their documentation. In addition to JTAG, the GoodFET has been **inspired by HackADay's Bus Pirate to become a universal serial bus interface.**

It "is a nifty little tool for quickly exposing embedded system buses to userland Python code.". Based on the bits and pieces I can pull together, I believe this will allow us to do our typical hardware based sniffing/dumping/etc, but I would have to find a better walkthrough/try it myself before being able to say that for certain.

Now one thing about this project that tends to confuse me is the versions/revision naming.. for example here are a number of the older revisions and their names:

* http://goodfet.sourceforge.net/hardware/goodfet10/ (rev 1, retired)
* http://goodfet.sourceforge.net/hardware/goodfet11/ (rev 2, retired)
* http://goodfet.sourceforge.net/hardware/goodfet20/ (rev 3, retired)
* http://goodfet.sourceforge.net/hardware/badfet20/ (rev 4, retired)
* http://goodfet.sourceforge.net/hardware/goodfet30/ (rev 5, retired)
* http://goodfet.sourceforge.net/hardware/goodfet21/ (rev 6, retired)
* http://goodfet.sourceforge.net/hardware/goodfet31/ (rev 8, retired)
* http://goodfet.sourceforge.net/hardware/goodfet40/ (rev 12, retired)
* http://goodfet.sourceforge.net/hardware/goodfet41/ (rev 13, retired)

As best I can tell.. there seem to be multiple parallel hardware versions at certain times.. based on different chipsets. And those versions may fork/merge at later times. Attempting to follow that logic.. the two most current (non-retired) revisions seem to be:

* http://goodfet.sourceforge.net/hardware/goodfet42/ (rev 22)
* http://goodfet.sourceforge.net/hardware/goodfet32/ (rev 25)

You should probably just spend time browsing around this site in general.. there are so many interesting sounding open-hardware designs.

* http://goodfet.sourceforge.net/
* https://github.com/travisgoodspeed/goodfet
* https://github.com/travisgoodspeed/goodfet/tree/master/contrib

You can order the boards (or request a free one!) from:

* http://goodfet.sourceforge.net/orders/
* https://www.adafruit.com/product/1279 (~US$50)
* http://www.riverloopsecurity.com/projects/goodfet/

Further reading:

* https://exfil.co/2016/02/11/goodfet-on-os-x/
* https://hackaday.com/tag/goodfet/

## Hardware: Facedancer, Beagledancer, Raspdancer (~2012-2018+, ~US$85-???)

(Make sure to look at the facedancer 2.0 below as well)

> The Facedancer21 is the twenty-fourth hardware revision of the GoodFET, owing its heritage to the GoodFET41 and Facedancer20. Unlike the general-purpose GoodFET boards, the only purpose of this board is to allow USB devices to be written in host-side Python, so that one workstation can fuzz-test the USB device drivers of another host.

The facedancer is less about capturing data, and more about emulating a USB device with software (python to be exact!). One reason for wanting to do this might be to fuzz the devices drivers on a host system, though I'm sure there could be a number of other creative uses too.. Maybe you want to allow one hardware device to masquerade as another and talk to it's drivers..

The following articles are a good read:

* http://travisgoodspeed.blogspot.com.au/2012/07/emulating-usb-devices-with-python.html
* http://travisgoodspeed.blogspot.com.au/2012/10/emulating-usb-dfu-to-capture-firmware.html
* [Scapy Support for USB Protocol on Facedancer Boards, MAX2420, etc](http://rmspeers.com/archives/252)

> The Facedancer hardware extends the GoodFET framework to allow for fast prototyping and fuzzing of USB device drivers. Software connect/disconnect allows the enumeration process to be repeated, and Ryan's fork allows for clean coding of the various data structures with Scapy.

You can find out more about the facedancer boards at:

* http://goodfet.sourceforge.net/hardware/facedancer21
* [Youtube: SEC-T 2012 - Trashing USB layers using the Facedancer Board - Travis Goodspeed](https://www.youtube.com/watch?v=x-7ezoFju6I) (2013)
* http://rmspeers.com/archives/252

You can order the board (or request a free one!) from:

* http://goodfet.sourceforge.net/orders/
* https://int3.cc/products/facedancer21 (~US$85)

Other hardware projects that connect with the facedancer:

* https://github.com/dominicgs/BeagleDancer : A Facedancer21 expansion board for the BeagleBone
* http://wiki.yobi.be/wiki/Raspdancer : Merging Facedancer11 and Facedancer21 with Raspberry Pi
* https://speakerdeck.com/doegox/raspdancer
* https://github.com/travisgoodspeed/goodfet/tree/master/contrib/facedancer/raspdancer

## Hardware: Beaglebone Black + USBProxy (~2013?)

(This has been superceded by the facedancer 2.0 below)

> A proxy for USB devices, libUSB and gadgetFS. A USB man in the middle device using embedded Linux devices with on the go controllers.

* https://github.com/dominicgs/USBProxy

Presentations/etc:

* [YouTube: NSA Playset: USB Tools [ShmooCon 2015]](https://www.youtube.com/watch?v=uDPxa5tcdnI) (2015) ([Overview](https://shmoo.gitbooks.io/2015-shmoocon-proceedings/content/build/01_nsa_playset_usb_tools.html), [Slides](https://github.com/dominicgs/dominicgs.github.io/blob/master/presentations/2015/NSA%20Playset-USB%20Tools-ShmooCon.pdf))
* [YouTube: BG - USB Write Blocking with USBProxy - Dominic Spill
](https://www.youtube.com/watch?v=rcfYgU-Be08) (2014) ([Slides](https://github.com/dominicgs/dominicgs.github.io/blob/master/presentations/2014/Spill_BSidesLV_USBProxy_slides.pdf))
* Youtube ([1](https://www.youtube.com/watch?v=5JnAeakUBnU), [2](https://www.youtube.com/watch?v=l9wnu97785s)): ShmooCon 2014: An Open and Affordable USB Man in the Middle Device (2014) ([Slides](https://github.com/dominicgs/dominicgs.github.io/blob/master/presentations/2014/Spill_USBProxy_ShmooCon_Slides.pdf), [Whitepaper](https://github.com/dominicgs/dominicgs.github.io/blob/master/presentations/2014/Spill_USBProxy_ShmooCon_paper.pdf), [CFP](https://github.com/dominicgs/dominicgs.github.io/blob/master/presentations/2014/Spill_USBProxy_ShmooCon_cfp.txt))
* [CFP: Haxpo - Protecting USB devices with USBProxy](https://github.com/dominicgs/dominicgs.github.io/blob/master/presentations/2014/Spill_USBProxy_Haxpo_cfp.txt)

## Hardware: Daisho (~2013-?2018+?)

> SuperSpeed USB 3.0 FPGA platform

This is a project designed for monitoring a number of high speed communication technologies at the physical layer, including USB 3.0, Gigabit ethernet, HDMI, etc. You can read more about it in the introduction blog:

* http://ossmann.blogspot.com.au/2013/05/introducing-daisho.html (tag: [daisho](http://ossmann.blogspot.com.au/search/label/daisho))

You can find more about the project at the following sites:

* https://greatscottgadgets.com/daisho/
* https://github.com/mossmann/daisho
* https://github.com/mossmann/daisho/wiki
* https://github.com/enjoy-digital/daisho_usb3ipcore_test

Presentations/etc:

* [YouTube: NSA Playset: USB Tools [ShmooCon 2015]](https://www.youtube.com/watch?v=uDPxa5tcdnI) (2015) ([Overview](https://shmoo.gitbooks.io/2015-shmoocon-proceedings/content/build/01_nsa_playset_usb_tools.html), [Slides](https://github.com/dominicgs/dominicgs.github.io/blob/master/presentations/2015/NSA%20Playset-USB%20Tools-ShmooCon.pdf))
* [YouTube: Black Hat USA 2013 - What's on the Wire? Physical Layer Tapping with Project Daisho
](https://www.youtube.com/watch?v=b2DsU1O6Lhg) (2013) ([Slides](https://media.blackhat.com/us-13/US-13-Spill-Whats-on-the-Wire-Slides.pdf), [Whitepaper](https://media.blackhat.com/us-13/US-13-Spill-Whats-on-the-Wire-WP.pdf))

## Hardware: GreatFET (~2015-2018+)

> GreatFET is a next generation GoodFET intended to serve as your custom Hi-Speed USB peripheral through the addition of expansion boards called "neighbors".

Better GoodFET hardware, cheaper. Sounds great to me.

According to the main site this is still at a 'functional prototype' stage though:

> Functional prototype hardware has been produced. Firmware is in progress.

That said.. looking around twitter and other places.. it sounds like it's pretty functional. Here are your main resources:

* http://greatscottgadgets.com/greatfet/
* https://github.com/greatscottgadgets/greatfet
* https://github.com/greatscottgadgets/greatfet-hardware
* https://github.com/greatscottgadgets/greatfet/wiki
* https://github.com/greatscottgadgets/greatfet/wiki/GreatFET-One

I couldn't find many resources about how to buy these.. but here is what I got:

* https://oshpark.com/shared_projects/qZFKUiwj

Presentations/etc:

* [YouTube: TR18 - Reverse Engineering Black Box Systems with GreatFET](https://www.youtube.com/watch?v=h3VWvZ162QE) (2018) ([Slides](https://download.ernw-insight.de/troopers/tr18/slides/TR18_AR_RE-Black-Box-Systems-GreatFET-Facedancer.pdf), [Agenda](https://www.troopers.de/troopers18/agenda/bcgyzl/))
* [YouTube: TR17 - Rusting up your GREATFET - Richo Healey, Dominic Spill](https://www.youtube.com/watch?v=4Ra9XNjNS3M) (2017) ([Slides](https://speakerdeck.com/richo/rust-greatfet))
* [YouTube: GreatFET: Making GoodFET Great Again](https://www.youtube.com/watch?v=4NIoAnsuFOQ) (2016) ([Slides](https://www.blackhat.com/docs/us-16/materials/us-16-Ossmann-GreatFET-Making-GoodFET-Great-Again-wp.pdf))

Further reading:

* https://hackaday.com/tag/greatfet/
* https://twitter.com/search?q=%23GreatFET&lang=en

## Hardware: Facedancer 2.0 (~2017-2018+)

> This repository houses the next generation of FaceDancer software. Descended from the original GoodFET-based FaceDancer, this repository provides a python module that provides expanded FaceDancer support-- including support for multiple boards and some pretty significant new features.

This is the v2.x of the facedancer, designed to be better/greater. I won't go too deeply into things, but the following are useful resources:

* https://github.com/ktemkin/facedancer
* https://github.com/ktemkin/facedancer#usbproxy-nouveau-and-protocol-analysis
  * Replaces [USBProxy](https://github.com/dominicgs/USBProxy)

Presentations/Training/etc:

* [YouTube: FaceDancer 2.0 (SHA2017)](https://www.youtube.com/watch?v=L3Ug9591Vag&list=PLnOI9rJWBVjE_xz7uGH4QKLiU5X0A7fjv&index=143) (2017) ([Slides](http://dominicspill.com/presentations/2017/Temkin_Spill_FaceDancer2_slides.pdf), [Slides2](https://github.com/dominicgs/dominicgs.github.io/blob/master/presentations/2017/Temkin_Spill_FaceDancer2_slides.pdf), [Twitter](https://twitter.com/dominicgs/status/895341394730123265))
* [YouTube: ToorCon 19 - Spill & Temkin - Facedancer 2.0 Next Generation USB Hacking](https://www.youtube.com/watch?v=HV9WfDRjJCg) (2017)
  * [Facedancer 2 starts at 35:16](https://youtu.be/HV9WfDRjJCg?t=2116)
* [Troopers Training: Hacking the USB World with FaceDancer](https://www.troopers.de/troopers18/trainings/jmpsxq/) ([PDF](https://hm-ts.de/pdf/TR18_HM_Hack_Facedancer.pdf), 2018)

## Commercial Hardware: TotalPhase BeagleUSB

TODO: Commercial device, various models from cheapish to super expensive, different capabilities based on USB speed, etc

* https://www.totalphase.com/products/beagle-usb12/
    * https://www.totalphase.com/support/articles/200800983-Beagle-USB-12-Protocol-Analyzer-Quick-Start-Guide
    * https://www.adafruit.com/product/708 $399.95
  * https://www.totalphase.com/products/beagle-usb480/ ~$1400, USB 2
  * https://www.totalphase.com/products/beagle-usb5000-v2-standard/ ~$3420, USB 3
  * https://www.totalphase.com/products/beagle-usb5000-v2-ultimate/ ~$5700, USB 2/3

## Further Reading/Presentations

I figured I'd add this section for some other interesting presentations/resources that just didn't seem to fit nicely into the categories above. Some of them go a little beyond just USB hardware hacking, and into more general/specific hardware hacking tools:

* [YouTube: DEF CON 22 - Jesse Michael and Mickey Shkatov - USB for all!!](https://www.youtube.com/watch?v=7HnQnpJwr-c) (2014) ([Slides](https://www.defcon.org/images/defcon-22/dc-22-presentations/Michael-Shkatov/DEFCON-22-Jesse-Michael-Mickey-Shkatov-USB-for-All!!-UPDATED.pdf))
* [YouTube: Tools of the Hardware Hacking Trade - Duo Tech Talk
](https://www.youtube.com/watch?v=PYeYxQqBTLo) (2014) ([Slides](https://www.blackhat.com/docs/webcast/04232014-tools-of-the-hardware-hacking-trade.pdf))

## People to Watch

While I was doing this reasearch there were a few names that just kept popping up time and time again, and seem to be working on really cool things in this space. To make it easier to follow them on their relevent platforms, I wanted to collect them together here for you (in no particular order):

* Travis Goodspeed (travisgoodspeed, [Twitter](https://twitter.com/travisgoodspeed), [GitHub](https://github.com/travisgoodspeed))
* Dominic Spill (dominicgs, [Twitter](https://twitter.com/dominicgs/), [GitHub](https://github.com/dominicgs/), [Website](https://dominicspill.com/))
* Kate Temkin (ktemkin, [Twitter](https://twitter.com/ktemkin/), [GitHub](https://github.com/ktemkin/), [Website](https://www.ktemkin.com/))
* Michael Ossmann (mossmann, [Twitter](https://twitter.com/michaelossmann), [GitHub](https://github.com/mossmann), [Website](http://www.ossmann.com/))
* Great Scott Gadgets ([Twitter](https://twitter.com/GSGLabs), [GitHub](https://github.com/greatscottgadgets), [Website](http://greatscottgadgets.com/))

If I've missed anyone that you feel deserves to be here too, please let me know!

## Code/Drivers/etc

So we know how to capture traffic from our devices, proxy it with hardware, break the protocols down and understand them. But we also want to be able to talk back to them, control them, and truly interact. This is where code and drivers comes in. Now we've sort of skimmed over these topics in a few of the above sections, but for the sake of clarity I wanted to group them all here as well.

When I first thought about writing this section I thought we were going to be getting deep into kernel drivers, and fighting with arcane systems, but it seems we actually have a much nicer alternative before all of that, thanks to **libusb, pyusb, and friends**:

* http://libusb.info/ ([GitHub](https://github.com/libusb/libusb)) : A cross-platform library to access USB devices
* https://github.com/pyusb/pyusb : USB access for Python
* https://github.com/LibUsbDotNet/LibUsbDotNet : Library for cross-platform USB device control using Mono/.NET

You can see examples of using libusb/pyUSB in some of the walkthroughs mentioned earlier.

Now while these libraries give us a whole lot of power and makes it pretty easy to write our software, there may be times where they just don't quite cover what we need. That's when we can go deeper into the weird and wonderful world of driver development. I won't cover this too in-depth at the moment as it could be a whole blog series on it's own, but a few resources to get you started:

* https://github.com/daynix/UsbDk : Usb Drivers Development Kit for Windows
* [LUFA (Lightweight USB Framework for AVRs)](http://www.fourwalledcubicle.com/LUFA.php) ([GitHub](https://github.com/abcminiuser/lufa))
* [Windows Driver Kit (WDK)](https://docs.microsoft.com/en-us/windows-hardware/drivers/ddi/content/index)
* https://github.com/pravic/winapi-kmd-rs : Windows Kernel-Mode Drivers written in Rust
* http://www.linuxvoice.com/be-a-kernel-hacker/

## Where next? Device Emulation, USB over IP, etc

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

Also, don't forget those hardware devices mentioned above that are designed for emulation..

Definitely an area that could be interesting to explore deeper, maybe in a future project/post.

## IoT, Hardware Hacking, Fuzzing, etc

Once we understand the language these devices speak, how to listen to it, how to emulate it.. what's next? One idea is to apply the concept of fuzzing used in the software world (random/crafted data used to look for crashes in software), and turn it to hardware. And with the prevalence of IoT devices out there now (often with woeful security).. this could be another interesting rabbithole to explore (google: `usb hardware fuzzing`):

* https://blog.quarkslab.com/usb-fuzzing-basics-from-fuzzing-to-bug-reporting.html (2014)
* https://github.com/nccgroup/umap : The USB host security assessment tool (~2013)
* [nccgroup/FrisbeeLite](https://github.com/nccgroup/FrisbeeLite) : A GUI-based USB device fuzzer
  * https://www.nccgroup.trust/au/our-research/fuzzing-usb-devices-using-frisbee-lite/ (2013)
* [ollseg/usb-device-fuzzing](https://github.com/ollseg/usb-device-fuzzing) :
Some tools for testing USB devices (2012)
* https://labs.mwrinfosecurity.com/blog/usb-fuzzing-for-the-masses/ (2011)
* https://wikileaks.org/hbgary-emails//fileid/64995/17596 : USB Protocol Fuzzer Options (2009)
* https://www.beyondsecurity.com/bestorm.html (commercial)
  * https://www.beyondsecurity.com/bestorm_usb_case_study.html

## Link Dump

After all of that.. there is only one little link left in my linkdump, and from memory, I think it was the post that started this cascading flow of rabbitholes. Not really anything to see here that we haven't already covered, but for posterity:

* https://electronics.stackexchange.com/questions/4180/reverse-engineering-usb-signals

## Conclusion

Well.. that got longer than I expected! What originally started out as me wanting to dump a few links I was collecting as I read into this subject, we seem to have ended up with a rough reference guide to getting started on AllTheThings(tm) relating to USB reverse engineering and associated hardware hacking.

While this post by itself isn't going to give you all the answers, hopefully it's given you enough of a base that you can branch out and dig deeper into the aspects that interest you. And when you do? Let me know what you build/break/discover!

Was there something I missed? A new shiny piece of hardware? An amazing program? Maybe you have some awesome techniques to share, or just a story about what you've been able to do with this newfound knowledge? I'd love to hear from you in the comments below!
