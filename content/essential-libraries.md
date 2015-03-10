---
title: Don't start a project without these essential 5 libraries
category: web-dev
date: 2015-03-10
bodyclass: article
---

I find the following libraries for io.js to be essential to a robust web project in 2015. The JavaScript stack is changing dramatically month by month, but good tools don't come by very often.

## Put everything together with Browserify

Browserify is a godsend. Being able to manage my front end JavaScript with NPM feels like the future. This library makes just about anything possible. Grab the companion Watchify library too to watch for changes to your files.

Get it: `npm install browserify watchify --save`

## Deal with old versions of IE with [Modernizr](http://modernizr.com/)

The shackles of old version of IE still haunt us. Modernizr makes it a bit less painful by letting us target unsupported features with a simple body class.

Get it: [modernizr.com](http://modernizr.com/)

## Use [Koa](http://koajs.com/) for your web serving needs

Koa is a lightweight web server perfect for localhost development. It makes use of ES6 features like promises and yield to return content for HTTP requests, but you don't have to learn about that to use it.

Get it: `npm install koa --save`

## Manage your templates with [React](http://facebook.github.io/react/)

React is a little different from your ordinary HTML templating library. You write your templates in JSX (or with JS functions, as I prefer) in a JavaScript. However, it offers the most performant way to update your HTML through a virtual DOM.

Get it: `npm install react --save`

## Simplify your CSS with [Stylus](http://learnboost.github.io/stylus/)

Stylus makes working with CSS [easier](../stylus-the-revolutionary-successor-to-css) than any other CSS preprocessor. Get the nib utility library too, for easy stylesheet resets, browser prefixes, and other useful mixins.

Get it: `npm install stylus nib --save`
