---
layout: post
title: Bye Bye Russian Spam
date: '2011-11-06T23:15:00-07:00'
tags:
- SpamAssassin
- spam
- config
tumblr_url: http://devalias.tumblr.com/post/12414238522/bye-bye-russian-spam
redirect_from: /post/12414238522/bye-bye-russian-spam
---
I’ve been getting hit pretty heavily lately with a pile of Russian spam, so I decided to look into adding language based spam filtering to my mailserver. This post serves as a reminder of what I did, and hopefully also helps some others in a similar situation.

## Location

* /etc/mail/spamassassin - Global
* /usr/share/spamassassin - User

## SpamAssassin Config File (local.cf)

Add the following line to your config file, ensuring any other ok_locale lines are commented (#) to increase the score for all mail that isn’t English or Japanese

`ok_locale en ja`

## SpamAssassin TextCat Plugin (v310.pre)

For versions greater than 3.1, you will also need to enable TextCat. Make sure the loadplugin line is uncommented in the v310.pre file.

```
# TextCat - language guessor
loadplugin Mail::SpamAssassin::Plugin::TextCat
```

## Restart

Now all thats left to do is restart your mailserver/spamassassin and you should be good to go!

## References

* http://spamassassin.apache.org/full/3.1.x/doc/Mail_SpamAssassin_Conf.html#language_options
* http://skullboxx.net/kb/node/77
