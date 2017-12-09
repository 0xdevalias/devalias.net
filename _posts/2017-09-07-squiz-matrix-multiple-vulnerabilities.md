---
layout: post
title: "Squiz Matrix: Multiple vulnerabilities"
tags:
- security
- cve
- squiz
- matrix
- bug-bounty
- bugcrowd
- xss
- rce
categories:
- devalias
disqus: true
webmention: true
crosspost_to_medium: false
---
Earlier this year I had an opportunity to spend some time looking at [Squiz Matrix](https://www.squiz.net/technology/cms), a Content Management System (CMS) used across a number of sectors including higher eduction, media and publishing, goverment, finance, health, and utilities. With a huge number of features, a massive PHP codebase, and a numbr of high profile sectors as clients, I set out to see if I could find any interesting little bugs hidden away.

While I won't get into the nitty gritty of most of the assessment process, I did find some things, and 3 CVE's were assigned (detailed below). One was interesting enough that I will probably write up the process in more detail at some point.

Given the rich functionality and plugins in the Matrix product, it could be interesting to dedicate more research time to explore the areas I didn't get to cover this time around. Who knows, perhaps Squiz would even be open to setting up a Bug Bounty program through someone like [Bugcrowd](https://www.bugcrowd.com/) in the future too. That would be cool!

If you want to try it out, or play around yourself, there is a [downloadable demo VM](https://matrix.squiz.net/releases/vm) available on the Squiz website.

## The CVE's

* **[CVE-2017-14196](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2017-14196)**: An information disclosure caused by a Path Traversal issue in the 'File Bridge' plugin allowed the existence of files outside of the bridged path to be confirmed.
* **[CVE-2017-14197](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2017-14197)**: Multiple reflected Cross-Site Scripting (XSS) issues in Matrix 'WYSIWYG' plugins.
* **[CVE-2017-14198](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2017-14198)**: Authenticated users with permissions to edit design assets can cause Remote Code Execution (RCE) via a maliciously crafted `time_format` tag.

## Remediation

These issues were fixed in version `5.4.1.3`. Update to this version or newer to be protected. See the CVE advisory details for more information.

## CVE-2017-14198: A Walkthrough

TODO: Write up how this was identified, and the core issue that lead to it.

## Acknowledgements

These issues were identified by [myself](http://devalias.net) and the team at [TSS](https://dtss.com.au):

* Glenn 'devalias' Grant (http://devalias.net) of TSS (https://dtss.com.au)

Special thanks to Micky at Squiz for being an amazing resource throughout the disclosure process, and keeping us informed as patching and rollout progressed.

## Conclusion

It seems the core issues here were a few bugs popping up in legacy code, and passing user-controlled values into sensitive areas without proper checks/sanitisation. Easy mistakes to make when managing such a large codebase that has evolved over the years.

Have you had a similar experience? Manage a large codebase and legacy code? Got good tips for how best to identify and avoid these sorts of issues? Would love to hear your ideas in the comments!
