---
layout: post
title: Reversing PowerShell 'SecureString' For Fun And Profit
date: '2013-08-28T15:00:52-07:00'
tags:
- PowerShell
- SecureString
- Decrypt
- Decode
- Reverse
- Hack
- Password
- Windows
- Pentest
tumblr_url: http://blog.devalias.net/post/59562171885/reversing-powershell-securestring-for-fun-and
---
Something that I needed to do in an engagement recently and thought it might be useful to you guys. Here’s a little function and demonstration to show just how insecure it is to store an encrypted PowerShell ‘SecureString’ WITH the key to decrypt it in a script file (or anywhere for that matter)

Just goes to show that no matter how secure a technology you create, in the end it all comes down to the underpaid, overworked IT staff that have to implement it, and the managerial guidelines that they need to work within.



https://gist.github.com/alias1/6101928
