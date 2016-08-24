---
layout: post
title: Kiwicon 8 (2014) - Some quick notes
date: '2014-12-16T08:08:04+11:00'
tags:
- kiwicon
- security
- conference
- hacking
- new-zealand
- '2014'
categories:
- devalias
tumblr_url: http://devalias.tumblr.com/post/105233769467/kiwicon-8-2014-some-quick-notes
redirect_from: /post/105233769467/kiwicon-8-2014-some-quick-notes
disqus: true
webmention: true
crosspost_to_medium: false
---
* [Kiwicon](https://kiwicon.org/)
  * [2014](http://2014.kiwicon.org/)
    * [Schedule](http://2014.kiwicon.org/the-con/schedule/)
    * [Talks](http://2014.kiwicon.org/the-con/talks/)

---

This was most definitely one of the most interesting, exciting, and downright awesome 'con experiences i've ever had! In the past i've pretty much kept to myself, watched the talks and headed home, but hung out/chatted/discussed with a lot of people over the course of the week, and it was epic! So so so definitely worthwhile!!

Not sure of the best way to go about this, so will just list out the different presentations and anything of interest/note from them.

I assume slides/etc should be up later on, so if something looks interesting, keep an eye out for that.

## [Thursday](http://2014.kiwicon.org/the-con/schedule/#Thursday11December)

* [Eve, Mallory, Ocean's 11, and Jack Bauer: Adversaries Real and Imagined](https://kiwicon.org/the-con/talks/#e146)
  * Nice overview of the different kinds of attackers, what they tend to be after, etc
  * Basically highlighted that you need to know what they are after and what it is worth, and balance security accordingly
* [Breaking Bricks and Plumbing Pipes: Cisco ASA a Super Mario Adventure](http://2014.kiwicon.org/the-con/talks/#e149)
  * Interesting talk about a plethora of security flaws found in Cisco firewall to gain a pivot point into the network
* [Asymmetric Defense, and your buyers guide to Threat Intelligence](http://2014.kiwicon.org/the-con/talks/#e150)
  * Essentially talked about how a lot of 'threat intelligence' out there is crap, and treated as 'more is better' rather than ''better is better'
  * Talked about how there needs to be standardises formats for digitally sharing/consuming threat intelligence
* [Seeing Blu](http://2014.kiwicon.org/the-con/talks/#e151)
  * Step by step walkthrough and thought process of how he hacked his BluRay player to enable multi region support so he could watch his copy of Hackers.
* [OneRNG - a verifiable and Open Hardware Random Number Generator from NZ](http://2014.kiwicon.org/the-con/talks/#e152)
  * Small open source/hardware device to generate truly random entropy, to be fed back into a random number generator
  * Recently released on kickstarter: https://www.kickstarter.com/projects/moonbaseotago/onerng-an-open-source-entropy-generator
* [Eradicating the Human Problem](http://2014.kiwicon.org/the-con/talks/#e147)
  * Really excellent talk by @lady_nerd talking about social engineering and humans as the weak point in security
  * Talked about how we need a better way to assess and track the human element of security, rather than treating it as too hard/unobtainable
  * Briefly discussed a tool in development designed to assist with mapping out the social interactions of a company in a way that allows assessing potential risk/etc, and determining the flow of an attack through the social elements of a company
  * Slides: https://twitter.com/lady_nerd/status/544230404170194945
* [Security the Etsy way: Effective security in a continuous deployment culture](http://2014.kiwicon.org/the-con/talks/#e142)
  * Excellent talk by @iodboi about mixing in security people with the general developers, not blocking progress/saying no while still maintaining security, making security liked/approachable, etc.
  * So many awesome points and discussions, not to mention showing just how epic a place Etsy is to work.
  * Caught up with him a decent bit after his talk and had some awesome chats, a really cool and down to earth guy
  * Etsy are a great example of continuous deployment, with upwards of 50 pushes into production every day
  * One of the big points: Don't hire assholes (they will ruin all of the work you put in to enhance security/etcs image and drag everyone down) https://twitter.com/hypatiadotca/status/542870405514801152
* [COMSEC - Beyond Encryption](http://2014.kiwicon.org/the-con/talks/#e153)
  * Discussion on maintaining communication security, tools that are good/bad, etc
  * Almost surprisingly, Apple factime rates pretty highly on the list.
  * Pond considered THE thing to use https://pond.imperialviolet.org/
* [MitMing GSM with criminal intent](http://2014.kiwicon.org/the-con/talks/#e154)
  * Discussed the analysis and thinking, and eventual pwning of a GSM enabled home detention ankle monitor
  * Made front page of the newspaper for the talk: http://www.nzherald.co.nz/nz/news/article.cfm?c_id=1&objectid=11373524
  * Same guy who broke the NZ transport card system last year
* [Building a hipster catapult, or how2own your skateboard](http://2014.kiwicon.org/the-con/talks/#e143)
  * Amusing talk about taking over control of a bluetooth controlled electric skateboard, including demonstration

## [Friday](http://2014.kiwicon.org/the-con/schedule/#Friday12December)

* [R00t Causes: complex systems failures and security incident response](http://2014.kiwicon.org/the-con/talks/#e167)
  * Analysis of a bridge collapse and how similar events map into security
  * Some key points: compartmentalise/isolate
* [ThruGlassXfer: The TV people? Do you see them?](http://2014.kiwicon.org/the-con/talks/#e156)
  * Interesting proof of concept and discussion on using the pixels on a screen and a video camera, combined with a programmable keyboard to initiate an ''air gapped' bidirectional communications channel.
  * Proves that if you can see it on the screen, and type into it, then you can basically bypass any other security in your way
  * http://thruglassxfer.com
* [Cyberwar before there was Cyber: Hacking WWII Electronic Bomb Fuses](http://2014.kiwicon.org/the-con/talks/#e144)
  * Research/analyse on various types of german bomb fuses, and the evolution of design/defuser used to outsmart each other
* [BeEF for Vegetarians (Hooked Browser Meshed-Networks with WebRTC)](http://2014.kiwicon.org/the-con/talks/#e157)
  * Pretty cool talk by @xntrik (co-author of browser hackers handbook) about creating mesh networks from exploited browsers to minimize detection/etc from communication with the command server
  * Useful for circumventing/stealthing internal lateral exploration through a network
* [An Image is Worth 1000 Frauds – Detecting Fake Images and Videos](http://2014.kiwicon.org/the-con/talks/#e158)
  * Interesting high level runthrough of some methods you can use to detect manipulated images/video
  * Linked to https://github.com/ebemunk/phoenix a lot
* [Manipulating Human Minds: The Psychological Side of Social Engineering](http://2014.kiwicon.org/the-con/talks/#e159)
  * Interesting talk by @0xkitty that takes a high level look at some of things involved in social engineering and manipulating the human element of security
* Lightning talks (shorter)
  * [Recap of the aftermath of last year's bus hacking](http://2014.kiwicon.org/the-con/talks/#e160)
    * Decent recap of what happened/how the incident was handled (eg. poorly)
  * [The National Cyber Security Strategy and the Connect Smart Partnership](http://2014.kiwicon.org/the-con/talks/#e161)
    * Some goverment guy that wasn't very engaging
  * [I know what you did last Wednesday: exploitation of the humble apartment video intercom](http://2014.kiwicon.org/the-con/talks/#e162)
    * Hacked his embedded linux apartment intercomm system to find exploits that enabled stealth monitoring of EVERY apartment in his building (100's)
  * [Voltron: Defender of the Universe](http://2014.kiwicon.org/the-con/talks/#e163)
    * Terminal based 'GUI' for GDB debugging
    * https://github.com/snare/voltron
  * [Random() Adventures in Minecrosoftcraft](http://2014.kiwicon.org/the-con/talks/#e145)
  	* A practical example of using analyses to defeat insecure 'random' implementations in the context of minecraft
  * [Legal loopholes](http://2014.kiwicon.org/the-con/talks/#e164)
  	* Some talk about grey areas of the law/etc
* [Breaking AV software](http://2014.kiwicon.org/the-con/talks/#e165)
  * Really interesting talk about just how insecure/terrible antivirus/security products in general can be (hint: VERY)
  * Showed how a large number of the top AV engines can actually end up making your system less secure due to the way they are implemented.
* [Hackers and Hacks, or: How I Learned to Stop Worrying and Love the MSM](http://2014.kiwicon.org/the-con/talks/#e166)
  * An enlightening talk by the reporters who engaged with ''rawshark' and the process/pitfalls they went through to in securely communicating to release the information.
  * Made some good points about security being hard for the ''average' person, and how so very major stories (eg. Snowden) were almost missed out on because reporters don't understand how to security well enough

## [Saturday](http://2014.kiwicon.org/the-con/schedule/#Saturday13December)

* [Kiwicon SPIT ROAST](http://2014.kiwicon.org/the-con/events/#e148)
  * We ate lots of meat, in a fortress!!
