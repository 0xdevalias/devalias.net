---
layout: post
title: How to SSH to iPhone/iPad/iDevice via USB
date: '2013-03-06T13:38:49-07:00'
tags:
- iOS
- iPhone
- iPad
- iDevice
- SSH
- USB
- libmuxd
- iproxy
- Burp Suite
- debug
- hack
- pentest
tumblr_url: http://blog.devalias.net/post/44676622353/how-to-ssh-to-iphoneipadidevice-via-usb
---
So in order to run the iPad through a debug proxy (Burp Suite), and still be able to forward on the traffic to the net, I needed to be able to talk to it over USB. (yay limited tech to work with!)
This wasn’t actually too hard to get going thanks to a little tool called usbmuxd.
Process
Install usbmuxd (i did this through homebrew: brew install libmuxd)
Startup the included iproxy tool (iproxy LOCAL_PORT DEVICE_PORT)iproxy 2222 22
Plug in your iDevice (I assume you already have SSH setup on it and enabled)
SSH to localhost:LOCAL_PORT, making sure to specify the account you want to logon asssh root@127.0.0.1 -p 2222
???
Profit!
Yay for things just working how they should!
