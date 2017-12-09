---
layout: post
title: "Symantec Web Gateway: Cross-Site Scripting (XSS) (CVE-2013-4670)"
tags:
- security
- cve
- symantec
- xss
categories:
- devalias
disqus: true
webmention: true
crosspost_to_medium: false
---
I found a Cross-Site Scripting (XSS) vulnerability within the Symantec Web Gateway.

## The CVE

* **[CVE-2013-4670](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2013-4670)**: Multiple cross-site scripting (XSS) vulnerabilities in the management console on the Symantec Web Gateway (SWG) appliance before 5.1.1 allow remote attackers to inject arbitrary web script or HTML via unspecified vectors.
    * [Security Advisories Relating to Symantec Products - Symantec Web Gateway Security Issues (SYM13-008)](https://www.symantec.com/security_response/securityupdates/detail.jsp?fid=security_advisory&pvid=security_advisory&year=&suid=20130725_00)

## Acknowledgements

This issue was identified by [myself](http://devalias.net), as well as independently by another security researcher:

* Glenn 'devalias' Grant (http://devalias.net)

> Symantec thanks Glenn 'devalias' Grant, http://devalias.net, for also reporting CVE-2013-4670 and working with us as we addressed them.
