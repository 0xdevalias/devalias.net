---
layout: post
title: vFeed - Wrapper/Helper Scripts For Speed and Efficiency
date: '2013-11-20T15:00:54-07:00'
tags:
- bash
- shell
- vfeed
- vulnerability
- efficiency
- pentest
- toolswatch
- tool
- gist
tumblr_url: http://devalias.tumblr.com/post/67532513020/vfeed-wrapper-helper-scripts-for-speed-and-efficiency
redirect_from: /post/67532513020/vfeed-wrapper-helper-scripts-for-speed-and-efficiency
---
Just wanted to share some quick little bash scripts I threw together to make vFeed a little quicker/more efficient for my use.

If you don’t know it already, [vFeed](https://github.com/toolswatch/vfeed) is an Open Source Cross Linked and Aggregated Local Vulnerability Database put together by the fine folks over at [ToolsWatch](http://www.toolswatch.org/vfeed/). You can query it for a whole bunch of information and details that may aid you in your pentests, all from the convenience of a local database.

To make life easier, I throw these scripts in my vFeed directory and symlink them from bin.

```
cd /path/to/bin
ln -s /path/to/vFeed/bin/vfeed.sh vfeed
ln -s /path/to/vFeed/bin/vfeedcli.sh vfeedcli
ln -s /path/to/vFeed/bin/vfeed_update.sh vfeed_update
```

Enjoy!

{% gist alias1/7554985 %}
