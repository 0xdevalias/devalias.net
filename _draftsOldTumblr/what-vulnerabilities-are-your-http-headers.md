# What vulnerabilities are your HTTP headers announcing to the world?

#http #headers #http headers #http response header #vulnerability #hack #pentest #vulnerability #version #outdated #information disclosure #security #iis #internet information services #apache #httpd #security through obscurity #defense in depth

TODO: tl;dr (include mention/link to sections below IIS, Apache, etc)

TODO: General introduction

https://www.owasp.org/index.php/Testing_for_Web_Application_Fingerprint_(OWASP-IG-004)
http://desenmascara.me/acerca/acerca#que-hago-si
http://searchdns.netcraft.com/
shodanhq.com



### Why should I care?

* TODO: Version numbers = more passive info = easier to identify potential vulnerabilities and exploit your website

### But hang on, isn't that "'security' through obscurity"??!?

For those of you who haven't come across the term before, 'Security through obscurity' is [defined by Wikipedia](http://en.wikipedia.org/wiki/Security_through_obscurity) as follows:

<blockquote>..a pejorative referring to a principle in security engineering, which attempts to use secrecy of design or implementation to provide security. A system relying on security through obscurity may have theoretical or actual security vulnerabilities, but its owners or designers believe that if the flaws are not known, then attackers will be unlikely to find them.</blockquote>

As we in the industry should all be well aware by now, if there is a flaw in a system (no matter how obscure or how few details are released about it) a determined individual (or group) will find it and exploit it for their own gains. So now with that little refresher on why security through obscurity is bad, back to the point at hand.

If hiding the details/version numbers from your HTTP response headers was the only thing you did to 'secure' you server, then you could most definitely call it "'security' through obscurity" and it would fall into the above category of not actually providing any real security at all. When used as part of a [defense in depth](http://en.wikipedia.org/wiki/Defense_in_depth_(computing)) approach however, this can add one more wall that your would be attacker has to work around to get to their end goal of exploiting your system.

### So how do I fix it then?

Ok, so we agree that it's probably not a good idea to hand details over to our would be attackers out there, so how can we go about fixing it? That really depends on the particular server software stack you're running, but I'll try and provide a few starting points for you:

#### Apache

Since the content in this section got so long I decided to move it into a seperate post: *Coming Soon*

#### Nginx

*  /etc/nginx/nginx.conf
*  server_tokens off;
* http://wiki.nginx.org/HttpCoreModule#server_tokens

#### IIS (Internet Information Services)
  * TODO

* ASP
  * TODO
* PHP
  * TODO

If I've missed anything, or you want to add some more details for other software stacks just send me a message and I will update this.

### Tools

* Chrome Extensions
  * [Server Details | WhiteFirDesign](https://chrome.google.com/webstore/detail/server-details/bdjdcpoklgpglobffdadmmjcgbknmkfh) – Show details about what software is powering a website, including some checks/alerts for outdated versions.
  * [Meta Generator Version | WhiteFirDesign](https://chrome.google.com/webstore/detail/meta-generator-version-ch/fahebfpoehlhpngkmdgldkkilflkelbl) – Checks the meta generator tag that is sometimes included in webpages to see if the page was generated from outdated software.
  * [Frameworks](https://chrome.google.com/webstore/detail/frameworks/jgghnecdoiloelcogfmgjgcacadpaejf) – Displays JavaScript frameworks used on a site.

### References/Additional Reading

* [Shhh… don’t let your response headers talk too loudly | troyhunt.com](http://www.troyhunt.com/2012/02/shhh-dont-let-your-response-headers.html)