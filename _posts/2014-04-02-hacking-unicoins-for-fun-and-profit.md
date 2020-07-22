---
layout: post
title: Hacking Unicoins for Fun and Profit (Stackoverflow.com April Fools 2014)
date: '2014-04-02T06:38:02+11:00'
tags:
- stackoverflow
- "stackoverflow.com"
- unicoin
- hack
- automated
- april-fools
- '2014'
- gist
categories:
- devalias
tumblr_url: http://devalias.tumblr.com/post/81346968483/hacking-unicoins-for-fun-and-profit
redirect_from: /post/81346968483/hacking-unicoins-for-fun-and-profit
disqus: true
webmention: true
crosspost_to_medium: false
---
[Stackoverflow](https://stackoverflow.com/) introduced an amusing little April Fools feature called 'Unicoins'. Essentially, this currency (that you can earn by mining rocks, since all of the (rather amusing) payment options are currently unavailable') allows you to by silly upgrades for the website. From 'Colorful comments' and 'Guaranteed Answer' through to 'Voting animations' which gives you 'happy unicorn animations everytime you vote'.

Anyways, long story short, I saw a system and wondered how to beat it. Turns out each rock is simply an AJAX request to /unicoin/rock to get a rock ID, and when you sucessfully mine it, you POST back a static fkey (bound to each user I assume?) and the rockId to /unicoin/mine?rock=theRockId

I've put together a little automagical javascript to prevent you all getting RSI. It's for health reasons.. honestly.

Enjoy your unicoins! <3 /dev/alias

https://gist.github.com/0xdevalias/9905949

{% gist 9905949 %}
