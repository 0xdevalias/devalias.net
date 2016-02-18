---
layout: post
title: Play! Framework - Seperated WS Library
date: '2014-06-25T10:48:00-07:00'
tags:
- Play!
- play
- play framework
- play2
- 2.3.x
- WS
- Play.WS
- Library
- Maven
- Typesafe
- playframework.com
- typesafe.com
tumblr_url: http://blog.devalias.net/post/89810672067/play-framework-seperated-ws-library
---
So as we all (should) know, Play! Framework has released v2.3.x

With it comes a whole range of new features, including one that caught my eye:


  Play WS
  
  Separate library
  
  The WS client library has been refactored into its own library which can be used outside of Play. You can now have multiple WSClient objects, rather than only using the WS singleton.


This was particularly exciting for me, as I’ve grown to know, understand and love the simple abstractions the Play WS library provides.

Sweet! So how do I get it in my projects? Had a look over at playframework@Github to no avail (was expecting a new repo)

After a little more digging, I came across the Play! Repositories page, which lead me to finding what I wanted.

A little xml magic later and we have the following for a maven project wanting to use the Java version of the WS library:

<dependencies>
{% highlight python %}
    <groupId>com.typesafe.play</groupId>
    <artifactId>play-java-ws_2.10</artifactId>
    <version>2.3.0</version>
{% endhighlight %}
</dependencies>

<repositories>
{% highlight python %}
    <id>Typesafe Releases</id>
    <url>http://repo.typesafe.com/typesafe/releases/</url>
{% endhighlight %}
</repositories>


Hope this saves you guys some time, and as always, happy hacking!

“There is no started application”

If you end up getting a “There is no started application” message when you try to use WS, you will need to do something like the following:

AsyncHttpClientConfig.Builder builder = new com.ning.http.client.AsyncHttpClientConfig.Builder();
NingWSClient wsClient = new play.libs.ws.ning.NingWSClient(builder.build());

// Instead of this
//WSRequestHolder ws = WS.url(url)

// Use this
WSRequestHolder ws = wsClient.url(url)


See the following for more details:

http://stackoverflow.com/questions/24881145/how-do-i-use-play-ws-library-in-normal-sbt-project-instead-of-play

Scala - Using WSClient: http://www.playframework.com/documentation/2.3.x/ScalaWS
Java - Using WSClient: http://www.playframework.com/documentation/2.3.x/JavaWS

(Note: The tl;dr/raw/likely most up to date notes I made for this are available as a gist)
