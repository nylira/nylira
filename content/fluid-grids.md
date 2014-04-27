---
title: Responsive Design & Fluid Grids
category: Interaction Design
date: 2011-04-05
bodyclass: essay
---

Responsive design is about saving time by making flexible elements that can be reused across multiple devices. Here are some tips I've learned while building fluid-width websites.

## Make Use of `box-sizing: border-box`

With the default box model, adding a `1px border` to two floats with %-based widths (e.g., 30% and 70%) breaks the layout. Your layout is now now `100% + 4px` wide, which is annoyingly unhelpful. Likewise with adding em-based padding. At this point, most practical coders will sigh and add a internal wrapper `div` with the border they want.

While adding another `div` is a fine (albeit hacky) solution, there's a cleaner way to do it. `box-sizing: border-box` is a CSS3 property that fixes the box model for these use cases. Instead of adding padding and borders to the width of the box, it subtracts the same amounts from the space inside of the box. 

Create this mixin in your [CSS preprocessor of choice](http://nylira.com/stylus-the-revolutionary-successor-to-css):

    box-sizing(n = border-box)
      -webkit-box-sizing: n
      -moz-box-sizing: n
      box-sizing: n

Now you can do the following to your heart's content:

    #announcement
      border-box()
      width 40%
      float left
      border 1px solid #ddd
      padding .75em 1em

And it will only ever be 40% wide. Nice, right?

__Any catches?__ While `box-sizing` is a CSS3 property, all browsers which support CSS2.1 will support `box-sizing: border-box`. That's every browser except IE6/7.

## There's more to the world than `float: left`

In the early days of CSS-based design, floats were all we had to achieve creative, tableless layouts. They are--and have always been--a hacky and buggy approach, but they've also been the best tools we've had. Most designers have a [Stockholme syndrome](http://en.wikipedia.org/wiki/Stockholm_syndrome) relationship with CSS floats.

Float-based layouts are fragile, prone to breaking, and require content clearing in most cases. Don't even try to do vertical alignment with variable-height floats. You'll need Javascript for that. The finicky nature of floats makes them ill-suited for the flexible, %-based world of web applications. What other options are there?

## `display: inline-block`
Useful for more than horizontal layout menus, `display: inline-block` can be used in many situations in place of floats. Along with the contents of table cells, inline blocks can be vertically aligned, which leads to intriguing layout possibilities.

One caveat to inline blocks is that whitespace in HTML matters. If there's a space between two `display: inline-block` elements, it will render on the site.

Inline blocks are supported by all browsers except IE6/7. There is [a hack available](http://blog.mozilla.com/webdev/2009/02/20/cross-browser-inline-block/) for IE6/7 support.

## `display: table-cell`
Most designers who learned CSS in the days of XHTML validation and web standards instinctively cringe away from anything related to tables. However, the property `display: table-cell` does not imply any sort of relation between the content and tabular data.

Using `display: table-cell` turns an element's display type into a `<td>`, the original `box-sizing: border-box` element. `<td>`s will automatically stretch to fill the available horizontal space. It's a great way to create columns of both variable width and height. Take for example an image next to a column of text. This is possible to do with floats, but when you introduce percentage-based padding, you save time with `display: table-cell`.

Using `display: table` will turn all of an element's direct descendants into `<td>` types. If you're making consistent use of this, consider taking another look at your data: perhaps a real table is in order.

Display table/table-cell is supported by all browsers except IE6/7.

## Alignment issues?

If you're using a CSS reset, you'll most likely encounter alignment issues using either `inline-block` or `table-cell`. There's no need to panic. [Eric Meyer's Reset CSS](http://meyerweb.com/eric/tools/css/reset/) sets all elements to `vertical-align: baseline`. That means elements of unequal heights will sit on a baseline instead of hanging from the top like floats.

__How to fix it?__ For `display: inline-block`, you'll need to set its parent element to `vertical-align: top`. For `display: table-cell`, you'll need to set it to `vertical-align: top`.
