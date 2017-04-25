---
layout: post
title: "Starting a New Web Application (Part 2): A Time to React"
tags:
- dev
- web
- tech-stack
- react
- flux
- facebook
categories:
- devalias
disqus: true
webmention: true
crosspost_to_medium: false
---
In [part 1](TODO) we started looking into the current web application landscape, and what technologies are out there. From what I learned through my research there, I have decided to delve further into [React](https://facebook.github.io/react/); partly because it's one of the current hot topics and seems really interesting, partly because I think Facebook are pretty cool and make some awesome things, and partly because it'll be a good skill to flesh out for my resume/future endeavours.

## ToC

* [Introductory Reading](#introductory-reading)
* [Desired Features](#desired-features)
* [React](#react)
* [Flux](#flux)
* [Libraries and Features](#libraries-features)
  * Routing
  * API's (REST, etc)
  * Authentication
  * Isomorphic
  * DevTools
* [Boilerplate, Starter Kits and Examples](#boilerplate-starters-examples)
* [Choosing my Stack and Tools](#stack-tools)
* [Conclusion](#conclusion)

## <a name="introductory-reading"></a>Introductory Reading

To save myself rewriting what's already been explained, here are some quick intro articles on React, Flux and JSX that helped my to understand it all a bit better. If you need a quick refresher, I'll see you in a minute:

* ["ReactJS For Stupid People" by Andrew Ray](http://blog.andrewray.me/reactjs-for-stupid-people/)
* ["Flux For Stupid People" by Andrew Ray](http://blog.andrewray.me/flux-for-stupid-people/)
* ["You're Missing The Point Of JSX" by Andrew Ray](http://blog.andrewray.me/youre-missing-the-point-of-jsx/)
* [React: Getting Started](https://facebook.github.io/react/docs/getting-started.html)
* [React: Tutorial](https://facebook.github.io/react/docs/tutorial.html)
* ["Navigating the React Ecosystem" by Tomas Holas](https://www.toptal.com/react/navigating-the-react-ecosystem)

## <a name="desired-features"></a>Desired Features

To help narrow down which libraries/solutions I might go with, it helped to have a bit of an idea of what sort of features/ideas I wanted to incorporate into my stack. In no particular order:

* Single page application
* Driven by a first-class API
* Microservices
* Token-based Authentication
* ['Feature First' Organization](https://medium.com/front-end-hacking/the-secret-to-organization-in-functional-programming-913484e85fc9)
* [Reactive](http://www.reactivemanifesto.org/)
* ['DRY'](https://en.wikipedia.org/wiki/Don%27t_repeat_yourself)
* [Isomorphic](http://nerds.airbnb.com/isomorphic-javascript-future-web-apps/)?

## <a name="react"></a>React

This one is nice and simple. [React](https://facebook.github.io/react/) is React. We don't have a crazy environment of different options, flavours and alternatives we need to weigh up and choose between here.

> React is a JavaScript library for creating user interfaces by Facebook and Instagram. Many people choose to think of React as the V in MVC. - [Why React?](https://facebook.github.io/react/docs/why-react.html)

If you need to know more about it, make sure to go back and brush up on the [introductory reading](#introductory-reading).

## <a name="flux"></a>Flux

[Flux](https://facebook.github.io/flux/) ([GitHub](https://github.com/facebook/flux)) is a concept [announced back in 2014](https://facebook.github.io/react/blog/2014/05/06/flux.html) by Facebook. Since it isn't a library like React, there are SO many flavours, choices and differing implementations. You could be stuck here in analysis paralysis forever.

> Flux is the application architecture that Facebook uses for building client-side web applications. It complements React's composable view components by utilizing a unidirectional data flow. It's more of a pattern rather than a formal framework, and you can start using Flux immediately without a lot of new code. - [Flux Overview](https://facebook.github.io/flux/docs/overview.html)

Thankfully a whole pile of different people have already put together some comparisons of different implementations, and why you might want to pick one over another:

* ["Which Flux implementation should I use?" on react-starter-kit](https://github.com/kriasoft/react-starter-kit/issues/22)
* ["Flux solutions compared by example" by pixelhunter](http://pixelhunter.me/post/110248593059/flux-solutions-compared-by-example) ([GitHub](https://github.com/voronianski/flux-comparison))

There are [even](https://github.com/justinwoo/react-rxjs-flow) [some](http://qiita.com/kimagure/items/22cf4bb2a967fcba376e) [people](https://github.com/AlexMost/RxReact) playing with the idea of skipping Flux entirely and using [RxJS](https://github.com/Reactive-Extensions/RxJS).

Reading through the various options out there, I pretty much came to the conclusion that I probably want to be looking at [Relay](https://facebook.github.io/relay/) by Facebook ([GitHub](https://github.com/facebook/relay), [Starter Kit](https://github.com/relayjs/relay-starter-kit)) and [Redux](http://redux.js.org/) ([GitHub](https://github.com/reactjs/redux)). I've briefly spoken about these two before in ["GraphQL: Why You Should Care"]({% post_url 2016-09-07-graphql-why-you-should-care %}#graphql-relay-redux). But for the sake of completeness, here are the relevant articles again:
* ["Comparing Redux and Relay" by Mikhail Novikov](https://www.reindex.io/blog/redux-and-relay/)
* ["Replacing Relay with Redux" by Matt Krick](https://medium.com/@matt.krick/replacing-relay-with-redux-2990c81aa807)
* ["Getting started with Redux and GraphQL" by James Childs-Maidment](https://medium.com/@thisbejim/getting-started-with-redux-and-graphql-8384b3b25c56)

While I think Relay is pretty cool, and seems like it will [only keep getting better](https://facebook.github.io/react/blog/2016/08/05/relay-state-of-the-state.html), I think sticking to a Redux based stack for the time being will suit my needs better. Though don't think that leaves you missing out. There are a number of projects that combine the best aspects of both worlds:

* [Apollo Stack](http://www.apollostack.com/)
* [Cashay](https://github.com/mattkrick/cashay): "Relay for the rest of us"
* [Adrenaline](https://github.com/gyzerok/adrenaline): "Simple Relay alternative"
* [React-Reach](https://github.com/kennetpostigo/react-reach): "A small library for React to communicate with GraphQL"

There also seems to be some pretty lively discussions worth watching as well:

* [Redux #464: "Relay and Redux"](https://github.com/reactjs/redux/issues/464)
* [Redux #775: "Has Redux's Time Come and Gone" ](https://github.com/reactjs/redux/issues/775)

A nice feature of Redux is that it [isn't just tied to React](http://redux.js.org/docs/basics/UsageWithReact.html); so you can write Redux apps with [React](https://github.com/reactjs/react-redux), [Angular](https://github.com/angular-redux), [Ember](http://www.ember-redux.com/), jQuery, or even vanilla JavaScript.

The best way to learn about Redux, how it works, and why you should care, is through the official (free) course: ["Getting Started with Redux"](https://egghead.io/courses/getting-started-with-redux) ([Notes](https://github.com/tayiorbeii/egghead.io_redux_course_notes))

Finally, while it might be a little early to throw this into the mix, for the sake of completeness in 'interesting things I read on this topic':

* ["Join The Dark Side Of The Flux: Responding to Actions with Actors" by James K Nelson](http://jamesknelson.com/join-the-dark-side-of-the-flux-responding-to-actions-with-actors/)

## <a name="libraries-features"></a>Libraries and Features

Following the DRY principles, there are bound to be tons of pre-existing libraries to help implement all sorts of features you may want/need. While it's always hard to truly know what you want till you get started, you could start by looking through some [awesome react](https://github.com/enaqx/awesome-react)/[react native](https://github.com/jondot/awesome-react-native) lists; or read on below.

**Routing**

* [React-Router](https://github.com/reactjs/react-router): This seems to be the de-facto standard.
  * [React-Router-Bootstrap](https://github.com/react-bootstrap/react-router-bootstrap)
* [Universal Router](https://github.com/kriasoft/universal-router): "A simple middleware-style router for isomorphic JavaScript web apps"

**API's (REST, etc)**

* ["Is there any good Http library for React flux architecture" on StackOverflow](https://stackoverflow.com/questions/33821053/is-there-any-good-http-library-for-react-flux-architecture)
  * [Fetch](https://github.github.io/fetch/) ([GitHub](https://github.com/github/fetch)): "A window.fetch JavaScript polyfill"
    * [Isomorphic-Fetch](https://github.com/matthew-andrews/isomorphic-fetch): "Isomorphic WHATWG Fetch API, for Node & Browserify"
  * [Superagent](https://github.com/visionmedia/superagent): "Ajax with less suck"
    * [React-Http-Request](https://github.com/mbasso/react-http-request): Uses superagent
  * [Axios](https://github.com/mzabriskie/axios): "Promise based HTTP client for the browser and node.js"

* [Restful.js](https://github.com/marmelab/restful.js): "A pure JS client for interacting with server-side RESTful resources. Think Restangular without Angular."

**Authentication**

* [Redux-Auth](https://github.com/lynndylanhurley/redux-auth): "Complete token authentication system for react + redux"
* [Redux-Auth-Wrapper](https://github.com/mjrussell/redux-auth-wrapper): "A React Higher Order Component (HOC) for handling Authentication and Authorization with Redux and React-Router"
* [React-Redux-JWT-Auth-Example](https://github.com/joshgeller/react-redux-jwt-auth-example): "Sample project showing possible authentication flow using React, Redux, React-Router, and JWT"

For some further reading on this topic:
* ["Build a React + Flux App with User Authentication" by Ryan Chenkie](https://scotch.io/tutorials/build-a-react-flux-app-with-user-authentication)
* ["Adding authentication to your React Flux app" by Martin Gontovnikas](https://auth0.com/blog/adding-authentication-to-your-react-flux-app/) ([GitHub](https://github.com/auth0-blog/react-flux-jwt-authentication-sample))
* ["Securing React Redux Apps With JWT Tokens" by rajaraodv](https://medium.com/@rajaraodv/securing-react-redux-apps-with-jwt-tokens-fcfe81356ea0)

**Isomorphic**

* [Hypernova](http://airbnb.io/projects/hypernova/) ([GitHub](https://github.com/airbnb/hypernova)): "A service for server-side rendering your JavaScript views"

**DevTools**

* [React Developer Tools](https://chrome.google.com/webstore/detail/react-developer-tools/fmkadmapgofadopljbjfkapdkoienihi)
* [Redux DevTools](https://chrome.google.com/webstore/detail/redux-devtools/lmhkpmbekcpmknklioeibfkpmmfibljd)

## <a name="boilerplate-starters-examples"></a>Boilerplate, Starter Kits and Examples

You might be noticing a bit of a trend: each step you take forward, there seem to be a million different options and considerations to make; and this is no different.

To try and avoid this decision fatigue and help new dev's dive head first into the React world, Facebook has released their very own starter tool: [Create-React-App](https://github.com/facebookincubator/create-react-app). It's early days still, but this is definitely something to keep an eye on going forward.

Looking through ["Awesome React Boilerplates"](http://habd.as/awesome-react-boilerplates/) and some of the other starter kit/generators out there, we have a lot to pick from. With so many options, a [tool to help narrow it down](http://andrewhfarmer.com/starter-project/) is pretty useful, but here are some others just in case:

* [React-Starter-Kit | Kriasoft](https://github.com/kriasoft/react-starter-kit) (10403): React, modular Flux (with Redux feature), Universal-Router, Babel, Webpack, GraphQL,
* [React-Boilerplate | mxstbr](https://github.com/mxstbr/react-boilerplate) (9052): React, Redux, React-Router, Babel, Webpack, CSS Modules
* [React-Slingshot | Cory House](https://github.com/coryhouse/react-slingshot) (4445): React, Redux, React-Router, Babel, Webpack, etc
* [React-Production-Starter | Jarad Palmer](https://github.com/jaredpalmer/react-production-starter) (834): React, Redux, React-Router, Immutable, Babel, Webpack, etc
* [Unicorn-Standard Starter-Kit](http://unicornstandard.com/packages/boilerplate.html) (403)

Or take a look at some examples:

* [Example: Traffic-Lights-Control](https://github.com/arturopala/traffic-lights-control)
  React, Redux, Akka, Akka-HTTP, WebSockets
* [React-Example-FilmDB](https://github.com/tomaash/react-example-filmdb): "Isomorphic React + Flux film database example"

## <a name="stack-tools"></a>Choosing my Stack and Tools

* TODO: Should this be in a new post?

SASS

Foundation or Bootstrap or Material?

https://nuclide.io/ (IDE)
  https://github.com/facebook/nuclide

https://flowtype.org/ (Typed JS)
  https://github.com/facebook/flow

With babel?

https://facebook.github.io/immutable-js/
  https://github.com/facebook/immutable-js/

Markdown
  https://github.com/jonschlinkert/remarkable

## <a name="conclusion"></a>Conclusion
