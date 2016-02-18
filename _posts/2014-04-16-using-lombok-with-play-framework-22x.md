---
layout: post
title: Using Lombok with Play! Framework 2.2x
date: '2014-04-16T18:44:47-07:00'
tags:
- play
- play2
- play!
- play framework
- lombok
- java
- '2.2'
tumblr_url: http://blog.devalias.net/post/82877817438/using-lombok-with-play-framework-22x
---
Lombok is a project that removes some of the tediousness of Java by letting you use annotations to replace the verbosity of Getters/Setters (and heaps of other cool things!)

This is mostly a note for me to help save a TON of time screwing around again.
Play 2.2.x works ‘out of the box’ just by including lombok in your dependencies

libraryDependencies ++= Seq(
  foo,
  bar,
  baz,
  "org.projectlombok" % "lombok" % "1.12.6"
)


Where you run into issues is that play eclipse won’t add the correct stuff for lombok to work correctly.
After a lot of messing around, I just went back to the method suggested on the site

Download from http://projectlombok.org/download.html
Run the installer and let it configure Eclipse
Done

<3
