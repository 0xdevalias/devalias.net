---
layout: post
title: Sparty - Sharepoint and Frontpage Auditing Tool (Now With More NTLM Authentication!)
date: '2013-11-13T15:00:52-07:00'
tags:
- pentest
- hack
- tool
- sparty
- sharepoint
- frontpage
- secniche
- secniche.org
- 0kn0ck
- Aditya K Sood
- Black Hat
- authentication
tumblr_url: http://blog.devalias.net/post/66844345127/sparty-sharepoint-frontpage-auditing-tool-now-with-more
---
I’ve been doing a little bit of poking around Sharepoint security lately, doing some research and playing with some assessment/pentest tools. One such tool (released this year at Black Hat USA) is called Sparty. Written by 0kn0ck (aka Aditya K Sood) of SecNiche Security Labs, Sparty is a tool designed to assist in auditing sites built on Microsoft Sharepoint and/or Frontpage.

From the official site:


Sparty is an open source tool written in python to audit web applications using sharepoint and frontpage architecture. The motivation behind this tool is to provide an easy and robust way to scrutinize the security configurations of sharepoint and frontpage based web applications. Due to the complex nature of these web administration software, it is required to have a simple and efficient tool that gathers information, check access permissions, dump critical information from default files and perform automated exploitation if security risks are identified. A number of automated scanners fall short of this and Sparty is a solution to that.


You can download a copy from the project page (I’ll be a good net citizen and won’t link directly to the .tar.gz)

I won’t dive into usage/etc here as it’s still a very early release too (v0.1!) So if you want to find out a bit more about that you should look at the Sparty Usage page over at SecNiche.

Now With More NTLM Authentication!

In playing with the tool there were a few things that I kept running into that gave me some minor annoyance that I had to work around.

Firstly, there was a hard version check for Python 2.6 (I was running 2.7), so before I could even list the help I had to disable that (simple fix)

The next issue was a little more frustrating at first, and took a bit longer to solve. In running the tool, I was only receiving 401 Unauthorized responses. After looking a little further into it, I discovered that this was due to the server requesting NTLM authentication, which the tool was not providing. A bit more hacking around (and a bunch of google/python documentation) and I had a solution that would allow me to enter my authentication credentials (or some I acquired) and then proceed with using the tool as normal.

Sharing is Caring!

As we know, sharing is caring, so i’ve made my changes (and any others I may make to Sparty in the future) available over at Github.

Click over to alias1/sparty and check it out!
