---
layout: post
title: Reversing PowerShell 'SecureString' For Fun And Profit
date: '2013-08-29T08:00:52+10:00'
tags:
- powershell
- securestring
- decrypt
- decode
- reverse
- password
- windows
- hack
- pentest
categories:
- devalias
tumblr_url: http://devalias.tumblr.com/post/59562171885/reversing-powershell-securestring-for-fun-and
redirect_from: /post/59562171885/reversing-powershell-securestring-for-fun-and
disqus: true
webmention: true
crosspost_to_medium: false
---
Something that I needed to do in an engagement recently and thought it might be useful to you guys. Here's a little function and demonstration to show just how insecure it is to store an encrypted [PowerShell](https://en.wikipedia.org/wiki/Windows_PowerShell) ['SecureString'](http://social.technet.microsoft.com/wiki/contents/articles/4546.working-with-passwords-secure-strings-and-credentials-in-windows-powershell.aspx) WITH the key to decrypt it in a script file (or anywhere for that matter)

Just goes to show that no matter how secure a technology you create, in the end it all comes down to the underpaid, overworked IT staff that have to implement it, and the *managerial guidelines* that they need to work within.

{% gist alias1/6101928 %}
