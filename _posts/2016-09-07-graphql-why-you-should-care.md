---
layout: post
title: "GraphQL: Why You Should Care"
tags:
- dev
- web
- tech-stack
- graphql
- relay
- redux
- cashay
- adrenaline
- sangria
- scala
- akka
- akka-http
- apollo-stack
- falcor
- rest
- hateos
- facebook
- netflix
categories:
- devalias
disqus: true
webmention: true
crosspost_to_medium: false
---
If you haven't yet come across [GraphQL](http://graphql.org/), it's kind of exciting stuff. It's a query language developed by [Facebook](https://code.facebook.com/posts/), that basically lets you request exactly the data you need for the given task; no more, no less. Sounds good right?

## Tell me more..

If you like to get into the nitty gritty of tech specs, you can head over to the [GraphQL Working Draft](https://facebook.github.io/graphql/) ([GitHub](https://github.com/facebook/graphql)) to have a deeper read, then play around with the [reference implementation](https://github.com/graphql/graphql-js) in JavaScript.

Though if specs aren't really your style, check out '[Learn GraphQL](https://learngraphql.com/)' and give their free short course a run through. Should get you up to speed!

## Ok. I'm in!

Excited? Want to dive into it? Need libraries for your particular tech stack? Head on over to the [Awesome GraphQL](https://github.com/chentsulin/awesome-graphql) list. You're bound to find what you need!

For my particular tech palette I was after something [Scala'esque](http://scala-lang.org/), maybe some [Akka-HTTP](http://doc.akka.io/docs/akka/2.4/scala/http/) to go with it. Seems I wasn't the only one! [Sangria](http://sangria-graphql.org/) ([GitHub](https://github.com/sangria-graphql/sangria)) is a Scala GraphQL implementation. They even have [an Akka-HTTP based example](https://github.com/sangria-graphql/sangria-akka-http-example). Perfect! Throw in a little [Relay support](https://github.com/sangria-graphql/sangria-relay) and this package is pretty much complete.

If you're looking for an all-in-one stack heading forward, I keep seeing a lot of good things posted by the team at [Apollo Stack](http://www.apollostack.com/) (by the [Meteor](https://www.meteor.com/) team), so would most definitely recommend keeping an eye on them. They also post a lot of really good articles [on their blog](https://medium.com/apollo-stack) too.

For some further reading, make sure to check out:

* ["Tutorial: How to build a GraphQL server" by Jonas Helfer](https://medium.com/apollo-stack/tutorial-building-a-graphql-server-cddaa023c035)

## GraphQL and Relay.. What about Redux?

A lot of things you'll read about GraphQL on the net will talk about it quite closely with [Relay](https://facebook.github.io/relay/), and given they were both released by Facebook, and sort of designed to work together, it makes a lot of sense. That said, you most definitely don't need to use Relay to take advantage of the awesomeness GraphQL provides!

KADIRA states it pretty well in [GraphQL vs Relay](https://kadira.io/blog/graphql/graphql-vs-relay):

> GraphQL provides a way to model and expose data in your app. You can use it on top of any kind of data source and use it with any kind of transport layer.

> Relay is an efficient client-side data-fetching technology built for React. It talks to a GraphQL Schema to get data. Relay also has a server-side part that adds some features on top of GraphQL.

There is a bunch of talk about how Relay is currently a pain to use, but Facebook seems to be [well aware of this issue](https://facebook.github.io/react/blog/2016/08/05/relay-state-of-the-state.html) and has future plans to make it much nicer to work with.

I think it's definitely worth keeping an eye on Relay in the future, but if you're not quite ready to jump in, you can always take advantage of the benefits of GraphQL while sticking to something like [Redux](http://redux.js.org/) ([GitHub](https://github.com/reactjs/redux)). For further reading:

* ["Comparing Redux and Relay" by Mikhail Novikov](https://www.reindex.io/blog/redux-and-relay/)
* ["Replacing Relay with Redux" by Matt Krick](https://medium.com/@matt.krick/replacing-relay-with-redux-2990c81aa807)
* ["Getting started with Redux and GraphQL" by James Childs-Maidment](https://medium.com/@thisbejim/getting-started-with-redux-and-graphql-8384b3b25c56)
* [Apollo Stack](http://www.apollostack.com/)
* [Cashay](https://github.com/mattkrick/cashay): "Relay for the rest of us"
* [Adrenaline](https://github.com/gyzerok/adrenaline): "Simple Relay alternative"

## GraphQL vs Falcor

So by now we should have a fairly good idea about what [GraphQL](http://graphql.org/) is. So what's [Falcor](http://netflix.github.io/falcor/)? This one comes from our friends over at [Netflix](http://techblog.netflix.com/). In essence, it turns all of your data sources into one giant JSON graph. Regardless of whether you're loading data remotely, have it cached locally, etc; you'll access it in the same way.

If you want to read deeper, I found these to be quite useful:

* ["What is the difference between Falcor and GraphQL?" on StackOverflow](https://stackoverflow.com/questions/32057785/what-is-the-difference-between-falcor-and-graphql)
* ["GraphQL vs. Falcor" by Jonas Helfer](https://medium.com/apollo-stack/graphql-vs-falcor-4f1e9cbf7504)
* ["Beyond REST: GraphQL vs. Falcor" by React-Etc](http://react-etc.net/entry/beyond-rest-graphql-vs-falcor)

The consensus that I came to is that it seems to be on par with GraphQL in a number of ways, but is probably a bit easier to implement and a bit less powerful overall. Apparently you could even go so far as to [query GraphQL with Falcor](http://hueypetersen.com/posts/2015/10/26/querying-graphql-with-falcor/), but not the other way. For my purposes, I think I'll be sticking with GraphQL.

It's also worth noting that Facebook has been using various flavours of GraphQL for a few years now, whereas Netflix is yet to (or has only recently) started using Falcor in production.

## API's: REST, HATEOS, Observables.. GraphQL!

I have read SO many articles over the years about the 'proper' way to design API's, and why styleX is so much better than styleY. With so much info out there, and so much conflicting advice (even within each supposed style), it's really easy to get stuck in analysis paralysis.

Greg Ziegan put together a [nice little article](https://medium.com/@gregoryziegan/how-graphql-taught-me-to-code-client-apps-1c631a9953bd) talking about his progression along this path: from REST, through [HATEOS](http://timelessrepo.com/haters-gonna-hateoas), observables, etc; and how he ended up at GraphQL. Following on from this, Sashko Stubailo makes a pretty good argument about why GraphQL is ["the next generation of API design"](https://medium.com/apollo-stack/graphql-the-next-generation-of-api-design-f24b1689756a).

While the benefits of a GraphQL-based API seem pretty obvious to me, it's not always feasible to jump straight into shiny new tech. Maybe you need to support legacy services, interact with 3rd-party API's, or allow other developers to consume your API without them having to learn the ins and outs of GraphQL. But thankfully, we don't need to pick one over the other!

The GraphQL team have a pretty good article on their blog about [wrapping REST API's in GraphQL](http://graphql.org/blog/rest-api-graphql-wrapper/), starting purely with the client-side, and later moving it to the backend. This idea plays in SO well with some little side-projects I've been thinking about over the years, and how it could be used to help decompose and combine existing API's.

## Conclusion

This is a scattering of the articles and things I have read through while learning more about GraphQL, and why it is so awesome. I definitely know it's a technology that I am super excited to start utilising in my future projects.

Have you come across any other awesome articles/tools related to GraphQL or similar? I'd love to hear about them! Let me know in the comments below.
