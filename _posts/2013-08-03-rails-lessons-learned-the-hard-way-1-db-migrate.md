---
layout: post
title: 'Ruby on Rails - Learned the hard way #1 - db:migrate'
date: '2013-08-03T08:00:38+10:00'
tags:
- ruby-on-rails
- rails
- db-migrate
- learned-the-hard-way
- gist
categories:
- devalias
tumblr_url: http://devalias.tumblr.com/post/57131166149/rails-lessons-learned-the-hard-way-1-db-migrate
redirect_from: /post/57131166149/rails-lessons-learned-the-hard-way-1-db-migrate
---
Decided I will make this a regular little mini collection of things I learned the hard way with Ruby on Rails. So here it is, lesson #1!

Generate your model first, make all manual edits, and then only AFTER you have made all your manual edits (and double checked them), run rake db:migrate. It will save you a fair few headaches.


{% gist alias1/5790864 %}
