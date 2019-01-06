---
title: The Making of Nylira v4
category: web-dev
date: 2014-09-29
bodyclass: article
---

In this article I'll go through the reasons why I rebuilt my site from the ground up, the objectives in my newest design, and my thoughts for future improvement. Hopefully you can find something in here to help you with your own site design.

## Why Do I Need To Redesign?

I need to redesign my site not because I'm bored of the old design, but because I've found several major problem areas with the previous design.

**1. There's no narrative in my old site.** There was so little text in the previous design that all a visitor sees is a list of links. A list of links to a large number of topics is not friendly to most of my visitors. Visitors to a website tend to have an expectation of what they'll see, and my old "table of contents"-like layout is not what they want.

**2. There was no useful navigation in my old site.** There was, in fact, navigation. But it required scrolling through the entire front page of my site. As my site homepage was quite long, it's not hard to imagine I was losing visitors who had a specific inquiry in mind but got lost in my link list.

**3. A long, linear page design is not an efficient use of space on larger screens.** My previous design revolved around a vertical list of links in no particular order of importance. The linearity of the design is actually not a problem. The problem is that I stuffed the list with far too many links, making reading them an arduous exercise. On larger displays especially, the lack of differently sized paged elements made the site design rather tedious.

## Redesign Objectives

Before I show you the code behind the site, I want to go into the reasoning for building the v4 site the way I have.

**The site's content must be easy to access on all devices.** I don't want mobile users to be stuck with the desktop version of the site. It's a pain to read wide columns text on a phone. To make my site accessible to as many devices as possible, I went ahead with [mobile first design](../mobile-first).

**The site must be secure as possible.** I'm a web designer, not a system administrator. While I could have used a CMS like Wordpress or a framework like Rails, I don't have the time or energy to constantly secure my software stack against exploits.  To this end, I decided to make my site entirely static HTML and CSS, with a bit of client-side JS.

**I want to learn some programming.** While I could have used one of many static site generators on GitHub, I decided to roll my own generator with LiveScript, Jade, and Stylus. I realize I'm reinventing the wheel here, but building my own site generator made me learn a lot of new things I never would have otherwise.

**The site has to be incredibly easy to update.** I find that a lot of my ideas for articles and blog posts die before I can publish them online, due to the friction involved in web publishing. I want to keep editing and publishing as simple as possible to reduce that friction. Thus I picked a syntax that is pretty much as close to plain text as possible: Markdown.

**The site should showcase my portfolio.** Web design portfolios look best with a dark gray or black background. My site's colors should be subtle in order to better present the work I have done. Thus I'm going back to Nylira v2's color scheme.

## Technical Details

To build my static site generator, I decided to use many of the same node.js libraries I used for [PRISM Break](../on-prism). I would write all the code in LiveScript. The templates would be powered by Jade. The CSS would be pre-processed by Stylus. The content would be written in Markdown.

## Todo

This redesign is a work in progress, and there are still things I want to do to it. Here's a list of things I still want to add to the site:

* Project logos for the [Projects](../projects/) index page.
* Consider adding categories or filters for the [Articles](../articles/) page.
* Next/Previous article buttons for individual article pages.
