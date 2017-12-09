---
layout: post
title: "Atlassian Confluence: Cross-Site Scripting (XSS) (CVE-2017-16856)"
tags:
- security
- cve
- atlassian
- confluence
- bug-bounty
- bugcrowd
- xss
categories:
- devalias
disqus: true
webmention: true
crosspost_to_medium: true
---
Earlier this year I spent some time delving into [Atlassian Confluence](https://www.atlassian.com/software/confluence) to see if I could dig up any bugs that had slipped through the cracks. I wasn't really expecting to turn up much, but I was super excited and surprised when I managed to find an issue within the RSS feed plugin leading to Cross-Site Scripting (XSS) (Twitter: [1](https://twitter.com/_devalias/status/922234470274498560), [2](https://twitter.com/_devalias/status/938271825414455298); LinkedIn: [1](https://www.linkedin.com/feed/update/urn:li:activity:6328008786355331072/), [2](https://www.linkedin.com/feed/update/urn:li:activity:6344043067401732096); BugCrowd: [1](https://bugcrowd.com/devalias), [2](https://bugcrowd.com/atlassian/hall-of-fame)).

Thanks to [Atlassian](https://www.atlassian.com/trust/security) and [BugCrowd](https://www.bugcrowd.com/) for running an awesome bug bounty program and giving researchers the opportunity to hack things, make the internet safer, AND get rewarded while doing so!

## The CVE

* **[CVE-2017-16856](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2017-16856)**: The RSS Feed macro in Atlassian Confluence before version 6.5.2 allows remote attackers to inject arbitrary HTML or JavaScript via cross site scripting (XSS) vulnerabilities in various rss properties which were used as links without restriction on their scheme.
    * [Confluece Bug Report (CONFSERVER-54395)](https://jira.atlassian.com/browse/CONFSERVER-54395)
    * [Confluence - Issues resolved in 6.5.2](https://confluence.atlassian.com/doc/issues-resolved-in-6-5-2-940701301.html)
    * [SecurityFocus](http://www.securityfocus.com/bid/102094)

## Remediation

This issue was fixed in Confluence `6.5.2`. Update to this version or newer to be protected. See the CVE advisory details for more information.

## Chaining bugs, social engineering and platform features

As part of my PoC, I put together some fun little phishing code using the Confluence web plugin API's. If there is interest (and I'm allowed), I might share it (and some of the useful features/places to look to build similar) sometime.

Once XSS is achieved, if the current user isn't already an 'elevated' administrator, the code provides error messages using standard Confluence GUI elements to convince the user to elevate their privileges with 'websudo'. Once they do that, you can basically abuse their full privileges to create new administrators, or (my favourite) install a small malicious plugin to provide Remote Code Execution (RCE) on the server.

While these aren't security issues in themselves, it does show how you can leverage social engineering techniques and other platform features to chain smaller issues into something more powerful and damaging.

## Acknowledgements

These issues were identified by [myself](http://devalias.net) and the team at [TSS](https://dtss.com.au):

* Glenn 'devalias' Grant (http://devalias.net) of TSS (https://dtss.com.au)

## Conclusion

It pays to look in places less travelled. If there are older features in products, or things that may not be as popular/used as often, try looking in there. Who knows what may have been overlooked.

Have you ever looked into some popular software and found issues you never expected to find? Got a cool story to share about it? Maybe you've chained some bugs in an interesting way, or just want to hear more about my PoC? I'd love to hear from you in the comments below!
