---
layout: post
title: "Starting a New Web Application (Part 1): An Exploration of Options"
tags:
- dev
- web
- tech-stack
- overview
- frontend
- backend
- react
- angular
- ember
- vue
- aurelia
- riot
- bootstrap
- foundation
- material-design
- javascript
- babel
- typescript
- coffeescript
- flow
- scala-js
- akka-http
- bootzooka
- play-framework
- hypernova
- ruby
- ruby-on-rails
- node
- express
- meteor
- python
- django
- php
- october-cms
- laravel
- webpack
- gulp
- grunt
categories:
- devalias
disqus: true
webmention: true
crosspost_to_medium: false
---
Finding myself with some free time (and looking into starting a new project), I thought I might catch myself up on the state of web technologies, and what might be a good stack to work with.

The details collected here are most certainly not a complete layout of the entire landscape, and there will no doubt be leanings toward my personal tastes ([reactive](http://www.reactivemanifesto.org/), api-driven, etc). You should use this more as a starter into your own deeper research than as a source of ultimate truth. With that out of the way, let's get into it!

**Quicklinks**

* [Frontend](#frontend)
    * [Frameworks](#frontend-frameworks)
    * [UI](#frontend-ui)
    * [Scripting](#frontend-scripting)
* [Backend](#backend)
* [Tooling](#tooling)
* [Conclusions](#conclusions)

## <a name="frontend"></a>Frontend

The frontend is the pretty, interactive, main part that people will be seeing. You can have the most amazingly streamlined and perfect backend code, but noone's going to notice and love it without a strong frontend to back it up.

**<a name="frontend-frameworks"></a>Frameworks**

The days of raw JavaScript and jQuery selectors is long gone. We're looking for a nice, modern framework to help put together our frontend. Here's a little selection of some of our options:

* [React](https://facebook.github.io/react/) ([GitHub](https://github.com/reactjs)) (most likely with a flavour of [Flux](https://facebook.github.io/flux/) ([GitHub](https://github.com/facebook/flux)))
    * A frontend framework from Facebook that is taking the web by storm. Probably my personal favourite from what I've seen so far.
    * It even let's you [build for native devices](https://facebook.github.io/react-native/)!
* [Angular (v2)](https://angular.io/) (or if you like outdated for some reason [AngularJS (v1)](https://angularjs.org/))
    * Also [available for native devices](https://mobile.angular.io/)
    * I was a big fan of AngularJS (v1), and I want to like v2, but I don't think it will be my main choice.
* There are a TON of other frontend frameworks, of varying popularity and support. I won't delve into them much, but there's heaps of info out there
    * [Ember](http://emberjs.com/)
    * [Vue.js](https://vuejs.org/)
        * From reading around the web, there's a decent amount of good stuff talking about Vue. In the end I decided against it since it's not supported by a big backer, and the skills aren't as useful on a resume. That said, for a personal project it could be a great fit!
        * https://vuejs.org/guide/comparison.html
        * http://blog.evanyou.me/2015/10/25/vuejs-re-introduction/
        * http://vuejs.org/2016/04/27/announcing-2.0/
        * [vue](https://github.com/vuejs/vue), [vue-rx](https://github.com/vuejs/vue-rx), [vue-resource](https://github.com/vuejs/vue-resource), [vue-router](https://github.com/vuejs/vue-router), [vuex](https://github.com/vuejs/vuex), [revuew](https://github.com/revue/revue)
    * [Aurelia](http://aurelia.io/)
    * [Riot](http://riotjs.com/) ([v2](https://muut.com/blog/technology/riot-2.0/))

As with most things, every man and his dog has their own opinion, so here are a few comparisons I found useful:

* ["Comparison of Angular 2 and React" by Mark Volkmann and Lance Finney](https://www.ociweb.com/resources/publications/sett/comparison-of-angular-2-and-react/)
* ["Angular 2 vs. React" by Itay Herskovits](http://blog.backand.com/angular-2-vs-react/)
* ["Angular 2 versus React: There Will Be Blood" by Cory House](https://medium.freecodecamp.com/angular-2-versus-react-there-will-be-blood-66595faafd51)
* ["Vue.js vs React.js" by Richard LaFranchi](https://rlafranchi.github.io/2016/05/03/vue-vs-react/)
* ["Why doesn’t MDG just adopt Vue.js and forget about React vs Blaze?"](https://forums.meteor.com/t/why-doesnt-mdg-just-adopt-vue-js-and-forget-about-react-vs-blaze/13926/6)

**<a name="frontend-ui"></a>UI**

Even if you like to go oldschool and code your site by hand in notepad/vi, you can't deny the ease/benefits of using a frontend UI framework.

* [Bootstrap](https://getbootstrap.com/) ([v4](https://blog.getbootstrap.com/2015/08/19/bootstrap-4-alpha/))
    * Released by Twitter, and arguably one of the most used frontend UI frameworks out there.
    * [React-Bootstrap](https://react-bootstrap.github.io/) ([GitHub](https://github.com/react-bootstrap/react-bootstrap))
    * [ng-bootstrap](https://ng-bootstrap.github.io/#/home) by the angular-ui team ([GitHub](https://github.com/ng-bootstrap/ng-bootstrap))
    * [ng2-bootstrap](https://valor-software.com/ng2-bootstrap/) by valor-software ([GitHub](https://github.com/valor-software/ng2-bootstrap))
* [Foundation](http://foundation.zurb.com/)
    * While not as well known as the other two mentioned here, those that make use of foundation swear by it.
    * [React-Foundation](https://react.foundation/) ([GitHub](https://github.com/nordsoftware/react-foundation))
    * [React-Foundation-Components](https://aruberto.github.io/react-foundation-components/)
* [Material Design](https://material.google.com/)
    * Following a set of design principals from Google, this lays out a slick, consistent look and feel.
    * [Material Design Lite](https://getmdl.io/)
    * [For React](http://www.material-ui.com/) ([GitHub](https://github.com/callemall/material-ui))
    * [For Angular (v2)](https://material.angular.io/) ([GitHub](https://github.com/angular/material2))
    * [For AngularJS (v1)](https://material.angularjs.io/) ([GitHub](https://github.com/angular/material))

Can't decide? Try some comparisons:

* ["The Rundown: Bootstrap vs. Google MDL vs. Foundation" by treehouse](http://blog.teamtreehouse.com/the-rundown-bootstrap-vs-google-mdl-vs-foundation)
* ["State of affairs: Bootstrap 4 vs Foundation 6.2" by Danny Herran](https://dannyherran.com/2016/03/state-of-affairs-bootstrap-4-vs-foundation-6/)

**<a name="frontend-scripting"></a>Scripting**

Modern web apps live by the functionality they enable in the browser, and to do this, we need a JS-esque language. Your chosen frontend framework may sway your choice (eg. Angular (v2) has a strong preference for TypeScript), but ultimately, it's up to what you/your team feel comfortable with. With [so many options](https://github.com/jashkenas/coffeescript/wiki/list-of-languages-that-compile-to-js) out there, it's hard to pick.. And of course, you could always stick to plain JavaScript.. and with the new features coming in [ES6](http://es6-features.org/) (eg. [promises](http://www.html5rocks.com/en/tutorials/es6/promises/)) and beyond, it might be a good choice.

* [Babel](https://babeljs.io/)
    * A transpiler that lets you play with all the fun features of JavaScript ES6 and beyond, while maintaining compatibility with all of the older browsers.
* [TypeScript](https://www.typescriptlang.org/) ([GitHub](https://github.com/Microsoft/TypeScript))
    * "TypeScript is a typed superset of JavaScript that compiles to plain JavaScript"
    * If you're using Angular (v2) and like sticking to convention, this is the one for you.
* [CoffeeScript](http://coffeescript.org/) (or maybe [v2](https://github.com/michaelficarra/CoffeeScriptRedux))
    * This used to be my choice, but looking at the other options available now, I think i'll be moving on.
    * As always, there are a bunch of arguments for and against..
        * ["Replace CoffeeScript with ES6" by Blake Williams](https://robots.thoughtbot.com/replace-coffeescript-with-es6)
        * ["Don’t Replace CoffeeScript with ES6 Transpilers" by Richard Feldman](http://tech.noredink.com/post/111583727108/dont-replace-coffeescript-with-es6-transpilers)
        * etc
    * If you're looking for a way out, why not [decaffeinate](https://github.com/decaffeinate/decaffeinate)?
* [Flow](https://flowtype.org/) ([GitHub](https://github.com/facebook/flow))
    * While it's not a language unto itself, it does allow you the benefits of typed JavaScript without having to dive into something like TypeScript.
* [Scala.js](https://www.scala-js.org/)
    * A little left field, this transpiles Scala code into JavaScript. While I probably wouldn't see myself using this as a main choice, it could make for some interesting reusability between front and backend.

## <a name="backend"></a>Backend

My preferences for backend tech stacks lean heavily towards [Scala](http://www.scala-lang.org/) and the [Lightbend Reactive Platform](https://www.lightbend.com/platform) these days, but I will make quick mention of some of the other options available.

* [Akka-HTTP](http://doc.akka.io/docs/akka/2.4/scala/http/)
    * Taking the power of asynchronous, message based actors, and applying them to HTTP. Definite win.
    * [Bootzooka](https://softwaremill.github.io/bootzooka/) ([GitHub](https://github.com/softwaremill/bootzooka))
        * "Bootzooka is a simple application scaffolding project to allow quick start of development for modern, web based applications."
        * While not perfect, it's a decent implementation of a starter app, tying together some useful technologies.
* [Play Framework](https://www.playframework.com/)
    * "Play is a high-productivity Java and Scala web application framework that integrates the components and APIs you need for modern web application development."
* [Hypernova](https://github.com/airbnb/hypernova)
    * "A service for server-side rendering your JavaScript views"
    * While not a choice unto itself, this should help speed things up and keep your site nice and search engine friendly.
* You also have all of your other typical options
    * [Ruby](https://www.ruby-lang.org/en/)
        * [Ruby on Rails](http://rubyonrails.org/)
        * [Sinatra](http://www.sinatrarb.com/)
        * [Node](https://nodejs.org/en/)
        * [Express](http://expressjs.com/): "Fast, unopinionated, minimalist web framework for Node.js"
        * [Meteor](https://www.meteor.com/): "Meteor is an open source platform for web,
        * ["Node.js Frameworks: The 10 Best for Web and Apps Development" by noeticsunil](http://noeticforce.com/best-nodejs-frameworks-for-web-and-app-development)
mobile, and desktop."
    * [Python](https://www.python.org/)
      * [Django](https://www.djangoproject.com/)
      * [Web Frameworks for Python](https://wiki.python.org/moin/WebFrameworks)
    * [PHP](https://secure.php.net/)
      * [October](https://octobercms.com/): "October is a free, open-source, self-hosted CMS platform based on the Laravel PHP Framework. A simple and modular CMS that grows with you, with a precise and beautiful interface that comes as second nature."
      * [Laravel](https://laravel.com/)
    * etc

## <a name="tooling"></a>Tooling

With the crazy mix of technologies and steps involved in modern web app development, it makes a ton of sense to tie it all together with some automation.

* [Webpack](https://webpack.github.io/) ([GitHub](https://github.com/webpack/webpack))
    * "Webpack is a bundler for modules. The main purpose is to bundle JavaScript files for usage in a browser, yet it is also capable of transforming, bundling, or packaging just about any resource or asset."
    * ["Webpack: When To Use And Why" by Andrew Ray](http://blog.andrewray.me/webpack-when-to-use-and-why/)
    * https://github.com/webpack/less-loader
    * https://github.com/shakacode/bootstrap-loader
* [Gulp](http://gulpjs.com/) ([GitHub](https://github.com/gulpjs/gulp)
    * Gulp is a streaming javascript task runner that lets you automate tasks.
* [Grunt](http://gruntjs.com/) ([GitHub](https://github.com/gruntjs/))
    * Grunt is basically the older, less streaming, less awesome version of Gulp.

While a little different in purpose to the things mentioned above, getting everything nicely tested and deployed is always good:

* [Bitbucket Pipelines](https://bitbucket.org/product/features/pipelines): "Build, test and deploy from Bitbucket"

## <a name="conclusions"></a>Conclusions

Hopefully this has given you a decent starting point for figuring out what combination of technologies is going to work best for your next project. If you want to see the direction I've decided to go, make sure you read on in [Part 2](#TODO).
