---
layout: post
title: "An unexpected journey with webpack and RequireJS"
tags:
- security
- bcdetect
- auth0
- nodejs
- npm
- gulp
- webpack
- requirejs
- plunker
- python
categories:
- devalias
disqus: true
webmention: true
crosspost_to_medium: false
---
So the other day I [ran into what seemed like a bug](https://github.com/blueclosure/BCDetect/issues/27) in some software I was using during a test. Narrowing things down in the codebase, it looked as though the error may have been related to a [library in use by the application](https://github.com/auth0/idtoken-verifier) I was testing.

I needed an easy way to isolate the code that seemed to be causing the error from the rest of the application, which took me down a rabbit hole to learn a little bit more about a few different technologies.

## The Situation

So I had a [JavaScript project](https://github.com/auth0/idtoken-verifier) that I wanted to build and include in a little test webpage. A few things in the repo stood out:

* [package.json](https://github.com/auth0/idtoken-verifier/blob/master/package.json) - So it's using [node.js](https://nodejs.org/) in some measure.
    * This also had a number of entries under the `scripts` section, including some that made use of `gulp` (another build tool)
* [gulpfile.js](https://github.com/auth0/idtoken-verifier/blob/master/gulpfile.js) - Another strong indicator that [gulp](https://gulpjs.com/) was in use. Didn't need to dig too deeply into this side of things, though it did indicate that `webpack` was in use.
* [webpack.config.js](https://github.com/auth0/idtoken-verifier/blob/master/webpack.config.js) / [webpack.prod.config.js](https://github.com/auth0/idtoken-verifier/blob/master/webpack.prod.config.js) - The [webpack](https://webpack.github.io/) configuration files.

So now I had a fair idea of what we had to work with, time to try and build it.

## Building with npm and gulp

This part was actually extremely straightforward, so I won't spend too long here. After cloning the repo, all I had to do was:

* `npm install`
* `npm build` (which is just a [script](https://github.com/auth0/idtoken-verifier/blob/master/package.json#L8) that runs `gulp build`)

After a bunch of downloads and a few warnings, I had 3 new files sitting in my `./build` folder. So easy!

* `idtoken-verifier.js`
* `idtoken-verifier.min.js`
* `idtoken-verifier.min.js.map`

For the purposes of my standalone test website, I should only need the main file.

## So I built it, but how do I use it?

Now that I had the library built, I just had to include the script in a little test webpage, call the functionality I needed, and I'd be done. But looking at the start of the built script.. it didn't look as straightforward as I expected.

```javascript
(function webpackUniversalModuleDefinition(root, factory) {
    if(typeof exports === 'object' && typeof module === 'object')
        module.exports = factory();
    else if(typeof define === 'function' && define.amd)
        define("idtoken-verifier", [], factory);
    else if(typeof exports === 'object')
        exports["idtoken-verifier"] = factory();
    else
        root["idtoken-verifier"] = factory();
})(this, function() {
```

Looks like `webpack` plays a part here.. and something called a 'universal module definition'.

## Webpack

I started off by doing a little reading about webpack config, and in particular this `umd` thing:

* https://webpack.github.io/docs/library-and-externals.html#configuration-options
* https://webpack.github.io/docs/configuration.html#output-librarytarget

So it seems that `webpack` allows you to export 'wrapped' modules in a number of formats, and `umd` is a combination of `amd`, `commonjs2` and/or a property in the root.

Sure enough, looking at the `output` section of the [webpack config](https://github.com/auth0/idtoken-verifier/blob/master/webpack.prod.config.js#L15-L21) I came across some references to `umd`:

```
output: {
  path: path.join(__dirname, '../build'),
  filename: '[name].min.js',
  library: 'idtoken-verifier',
  libraryTarget: 'umd',
  umdNamedDefine: true
},
```

At this point I decided to learn how to use an `amd` module, and after some quick googling I was lead to RequireJS.

## RequireJS

[RequireJS](http://requirejs.org/) is a JavaScript module loader, and [supports AMD](http://requirejs.org/docs/whyamd.html) (or 'Asynchronous Module Definition') modules. Since I just wanted to get this code working, I went back to Google to find a quick example of how to use RequireJS, finding myself on the following page:

* https://coderwall.com/p/u8xgvq/requirejs-basic-introduction

So it sounds like RequireJS handles a lot of the module injection/ordering that I would have otherwise had to think about myself. I decided to make life easy for myself and use [a CDN hosted version](https://cdnjs.com/libraries/require.js/), so all I had to do was stick the following code in the `head` section of my test page:

```html
<script data-main="main" src="https://cdnjs.cloudflare.com/ajax/libs/require.js/2.3.4/require.js"></script>
```

This loaded RequireJS and told it to inject the `main.js` file, which looks like:

```javascript
require(['idtoken-verifier'], function(IdTokenVerifier){
    var verifier = new IdTokenVerifier({});
    // Do interesting things here..
});
```

Sticking to the 'easy and obvious' pattern that I'd seen so far, this would inject the `idtoken-verifier.js` file, and then make the library accessible inside this `require` block. Nice!

## Bringing it all together with Plunker

I wanted to keep all of the files together in an easily accessible format so others could test and play with it. After a little looking around I ended up using [Plunker](http://plnkr.co/) since it let me have multiple files (unlike [JSFiddle](https://jsfiddle.net/)):

* http://plnkr.co/edit/4BMgtaSt03R9tMY5Hcki

## Success?

I found that trying to test the Plunker hosted version complicated things a bit, so I ended up downloading the zipped files and hosting them locally with Python while I tested things:

```bash
python -m SimpleHTTPServer
```

Running it through the tool.. everything worked as expected, no bugs. *sadface* I could have spent more time digging into the specifics and trying to unearth what actually lead to the bug in the first place, but given I had other things I needed to test I decided to leave that as a possible future endeavour, if I run into it again.

## Conclusion

So an unexpected rabbit hole lead me to understand a little more about Webpack, RequireJS and how to use packaged JavaScript applications. Not a bad little lesson :)

Had a similar experience or got any interesting tips to share about any of these technologies? Would love to hear from you in the comments!
