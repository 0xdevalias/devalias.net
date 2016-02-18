---
layout: post
title: vFeed - Wrapper/Helper Scripts For Speed and Efficiency
date: '2013-11-20T15:00:54-07:00'
tags:
- bash
- shell
- vFeed
- vulnerability
- efficiency
- pentest
- toolswatch
- tool
tumblr_url: http://blog.devalias.net/post/67532513020/vfeed-wrapper-helper-scripts-for-speed-and-efficiency
---
Just wanted to share some quick little bash scripts I threw together to make vFeed a little quicker/more efficient for my use.

If you don’t know it already, vFeed is an Open Source Cross Linked and Aggregated Local Vulnerability Database put together by the fine folks over at ToolsWatch. You can query it for a whole bunch of information and details that may aid you in your pentests, all from the convenience of a local database.

To make life easier, I throw these scripts in my vFeed directory and symlink them from bin.


cd /path/to/bin
ln -s /path/to/vFeed/bin/vfeed.sh vfeed
ln -s /path/to/vFeed/bin/vfeedcli.sh vfeedcli
ln -s /path/to/vFeed/bin/vfeed_update.sh vfeed_update


Enjoy!



https://gist.github.com/alias1/7554985
