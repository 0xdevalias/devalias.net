---
layout: post
title: How to SSH to iPhone/iPad/iDevice via USB
date: '2013-03-07T07:38:49+10:00'
tags:
- iOS
- iPhone
- iPad
- iDevice
- ssh
- usb
- libmuxd
- iproxy
- burp-suite
- debug
- hack
- pentest
categories:
- devalias
tumblr_url: http://devalias.tumblr.com/post/44676622353/how-to-ssh-to-iphoneipadidevice-via-usb
redirect_from: /post/44676622353/how-to-ssh-to-iphoneipadidevice-via-usb
disqus: true
webmention: true
crosspost_to_medium: false
---
So in order to run the iPad through a debug proxy (Burp Suite), and still be able to forward on the traffic to the net, I needed to be able to talk to it over USB. (yay limited tech to work with!)

This wasn't actually too hard to get going thanks to a little tool called usbmuxd.

## Process

1. Install usbmuxd (i did this through homebrew: brew install libmuxd)
2. Startup the included iproxy tool (`iproxy LOCAL_PORT DEVICE_PORT)iproxy 2222 22`)
3. Plug in your iDevice (I assume you already have SSH setup on it and enabled)
SSH to localhost:LOCAL_PORT, making sure to specify the account you want to logon as `ssh root@127.0.0.1 -p 2222`
5. ???
6. Profit!

Yay for things just working how they should!
