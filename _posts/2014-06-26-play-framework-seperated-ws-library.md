---
layout: post
title: Play! Framework - Seperated WS Library
date: '2014-06-26T03:48:00+10:00'
tags:
- play-framework
- 2.3.x
- ws
- play-ws
- library
- maven
- typesafe
- playframework.com
- typesafe.com
categories:
- devalias
tumblr_url: http://devalias.tumblr.com/post/89810672067/play-framework-seperated-ws-library
redirect_from: /post/89810672067/play-framework-seperated-ws-library
disqus: true
webmention: true
crosspost_to_medium: false
---
So as we all (should) know, [Play! Framework](https://www.playframework.com/) has released [v2.3.x](https://www.typesafe.com/blog/announcing-play-230)

With it comes a [whole range](https://www.playframework.com/documentation/2.3.x/Highlights23) of new features, including one that caught my eye:

> Play WS
>
> Separate library
>
> The WS client library has been refactored into its own library which can be used outside of Play. You can now have multiple WSClient objects, rather than only using the WS singleton.

This was particularly exciting for me, as I've grown to know, understand and love the simple abstractions the Play WS library provides.

Sweet! So how do I get it in my projects? Had a look over at [playframework@Github](https://github.com/playframework) to no avail (was expecting a new repo)

After a little more digging, I came across the [Play! Repositories](https://www.playframework.com/documentation/2.3.x/Repositories) page, which lead me to finding what I wanted.

A little xml magic later and we have the following for a maven project wanting to use the Java version of the WS library:

```
<dependencies>
    <groupId>com.typesafe.play</groupId>
    <artifactId>play-java-ws_2.10</artifactId>
    <version>2.3.0</version>
</dependencies>

<repositories>
    <id>Typesafe Releases</id>
    <url>http://repo.typesafe.com/typesafe/releases/</url>
</repositories>
```

Hope this saves you guys some time, and as always, happy hacking!

## "There is no started application"

If you end up getting a "There is no started application" message when you try to use WS, you will need to do something like the following:

```
AsyncHttpClientConfig.Builder builder = new com.ning.http.client.AsyncHttpClientConfig.Builder();
NingWSClient wsClient = new play.libs.ws.ning.NingWSClient(builder.build());

// Instead of this
//WSRequestHolder ws = WS.url(url)

// Use this
WSRequestHolder ws = wsClient.url(url)
```

See the following for more details:

* http://stackoverflow.com/questions/24881145/how-do-i-use-play-ws-library-in-normal-sbt-project-instead-of-play
  * Scala - Using WSClient: http://www.playframework.com/documentation/2.3.x/ScalaWS
  * Java - Using WSClient: http://www.playframework.com/documentation/2.3.x/JavaWS

(Note: The tl;dr/raw/likely most up to date notes I made for this are [available as a gist](https://gist.github.com/alias1/288dce6b353f2a72a7d4))
