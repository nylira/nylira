
---
title: Redesigns
category: design
date: 2010-04-02
---

<ul class="table-of-contents">
  <li> [Redesign: Ruby](#ruby) </li>
  <li> [Redesign: Acorn](#acorn) </li>
  <li> [Redesign: Drawar Bank ](#drawar) </li>
</ul>

*Due to accidental data loss, most of the following linked designs are no longer available. Apologies for the inconvenience!*

* * *

<h1 id="ruby">Redesign: Ruby Programming Language Homepage</h1>
## date: 2010-03-25

I redesigned the Ruby Programming Language homepage. Everything that you see--with the exception of [the logo](http://rubyidentity.org/)--consists of just two text files. Cascading stylesheets have come a long way since 1999. 

My goal for the design was to make a monochromatic & image-less layout look visually striking and pretty. I think I've mostly succeeded.

I have to say that I really love designing with just a text editor. Photoshop is unwieldy, cumbersome and utterly unsuited for most web design work. Sure, it still comes in handy for more illustration-heavy or textured websites. But for the majority of elegant and clean websites, a text editor works better and is magnitudes faster.

<a href="http://v2.nylira.com/p/ruby"><img src="http://v2.nylira.com/tumblr/posts/ruby.jpg"></a>

Browser notes: this design looks best in Safari/Mac or Firefox 3.6+. I seemed to have broken Chrome's rendering engine with the gradient spammage. If you use IE or Opera, <a href="http://v2.nylira.com/portfolio/ruby">here's a picture</a>.

The <a href="http://ruby-lang.org">current ruby-lang.org</a>, for comparison.

* * *

<h1 id="acorn">Redesign: Acorn</h1>
## date: 2010-04-02

Acorn homepage redesign. <a href="http://flyingmeat.com/acorn">Acorn</a> is a Mac image editing program developed by Flying Meat Inc.

<a href="http://v2.nylira.com/p/acorn/"><img src="http://v2.nylira.com/tumblr/posts/acorn.jpg" /></a>

* * *

<h1 id="drawar-bank">Redesign: Drawar Bank</h1>
## date: 2010-04-22

Bank mockup designed for [Drawar's Version2.001](//www.drawar.com/forums/84/version2000--online-banking-statements/).

##Safari

Unfortunately, the design only completely works in Safari. Such is life when developing on the bleeding edge.

<a href="//v2.nylira.com/tumblr/posts/bank-safari-big.jpg"><img src="//v2.nylira.com/tumblr/posts/bank-safari.jpg" alt="Drawar Bank rendered by Safari 4/Win" title="Drawar Bank rendered by Safari 4/Win"></a>

##Firefox

Firefox 3.6+ gets most of the design correct. but has issues displaying the SVG graph and leaves unsightly white margins between actions. Webkit's gradient engine (which powers Safari and Chrome) considers borders part of the "background area" when it renders gradients. Firefox's Gecko engine does not. The discrepancy is quite frustrating when you try to use RGBA/HSLA borders.

<a href="//v2.nylira.com/tumblr/posts/bank-firefox-big.jpg"><img src="//v2.nylira.com/tumblr/posts/bank-firefox.jpg" alt="Drawar Bank rendered by Firefox 3.6/Win" title="Drawar Bank rendered by Firefox 3.6/Win"></a>

##Chrome

Chrome has issues rendering all the CSS3 gradients. There's also noticeable color banding in Chrome's gradients, a flaw you don't see with Safari or Firefox. On the upside, Chrome's V8 Javascript engine blows every other browser out of the water when it comes to transitions.

<a href="//v2.nylira.com/tumblr/posts/bank-chrome-big.jpg"><img src="//v2.nylira.com/tumblr/posts/bank-chrome.jpg" alt="Drawar Bank rendered by Chrome 5/Win" title="Drawar Bank rendered by Chrome 5/Win"></a>

View the <a href="//v2.nylira.com/p/bank">bank mockup</a> live.

##Sass

I used this as an opportunity to learn more about [Sass](//sass-lang.com/). Sass is a powerful abstraction layer for CSS. It supports variables, mixins, simple arithmetic, and basic looping functions. Writing Sass is essentially writing CSS without brackets or semicolons.

Check out the difference in size between the [screen.css](//v2.nylira.com/p/bank/css/screen.css) and [screen.sass](//v2.nylira.com/p/bank/css/sass/screen.sass) files. screen.css is 675 lines long and weighs in at 22.6 KB. screen.sass is 439 lines long and weighs in at 10.1 KB.

How is this possible? Most of Sass's power comes from mixins.

    // here's a simple example
    =border-radius($r: 5px)
      border-radius: $r
      -webkit-border-radius: $r
      -moz-border-radius: $r
    
    // call it in screen.sass
    +border-radius
    
    // outputs this in screen.css
    border-radius: 5px;
    -webkit-border-radius: 5px;
    -moz-border-radius: 5px;
    
    // if you want to change the border radius, it's simple
    +border-radius(20px)
    
    // outputs
    border-radius: 20px;
    -webkit-border-radius: 20px;
    -moz-border-radius: 20px;

It certainly saves a lot of tedious and repetitive typing. This is only the tip of the iceberg, too. Take a look at my default [mixins.sass](//v2.nylira.com/p/bank/css/sass/_mixins.sass) file for more examples.

##A minor gripe

The only issue I have with Sass is that its compiling speed isn't as fast as I would like. I'm used to saving my CSS file and then reloading my browser to instantly see my changes. With Sass playing middleman, it can take another second before the changes are reflected in the browser.

If this has piqued your interest, check out the [official Sass website](http://sass-lang.com/) for more information. 

