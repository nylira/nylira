---
title: Stylus, the Revolutionary Successor to CSS
date: 2011-03-05
---

About a month ago, [Stylus](http://learnboost.github.com/stylus) was released, to little fanfare. 

It's rapidly become my favorite web development tool. Cleaner and more flexible than [Sass](http://sass-lang.com/), Stylus is by far the best CSS preprocessor in the wild. If you're unfamiliar with preprocessors, just imagine adding variables, functions, and simple arithmetic to CSS. While the additions may seem daunting to beginners, these advanced abstractions are desperately needed by maintainers of complex stylesheets.

Stylus syntax strips away all colons, semicolons, brackets and most parentheses from regular CSS script. The stark simplicity and elegance of it reminds me of Lisp. What's more amazing is that Stylus will also accept regular CSS syntax in the same file, reducing possible friction between multiple contributers.

Here's a sample of Stylus, a bit of code that powers this very site:

    section.markdown
      aside
        col 4
        ml - c4
        h2
          alt-font()
          color anchor
          mb m2
        ul
          ls none

      ul.process
        ml -4c
        clear()
        li
          float left
          mar 0 0 1px 1px
          p
            pad m
            mar 0
            square c4 - m2 - 1px
            alt-font()
            color #ccc
            transition()

You'll notice that I've trimmed down many CSS properties: `background` is now `bg`, `border-color` is `bc`, `margin-left` is `ml`, etc. Where I used to use `margin: 0 0 2em;` (fewer characters than `margin-bottom: 2em;`), I now use `mb m2`. The ability to abbreviate properties saves countless amounts of typing, and is reason enough to use Stylus.

Here's the generated CSS by comparison:

    body.profile #content section.profile section.markdown aside {
      width: 320px;
      float: left;
      margin-left: -320px;
    }
    body.profile #content section.profile section.markdown aside h2 {
      font: bold 13px DIN, "Helvetica Neue", Arial, Helvetica, sans-serif;
      line-height: 24px;
      text-transform: uppercase;
      -webkit-font-smoothing: antialiased;
      color: #555;
      letter-spacing: 1px;
      color: #ff006a;
      margin: 0 0 16px;
    }
    body.profile #content section.profile section.markdown aside ul {
      list-style: none;
    }
    body.profile #content section.profile section.markdown ul.process {
      margin-left: -320px;
    }
    body.profile #content section.profile section.markdown ul.process:after {
      display: block;
      clear: both;
      content: "";
    }
    body.profile #content section.profile section.markdown ul.process li {
      float: left;
      margin: 0 0 1px 1px;
      list-style: none;
    }
    body.profile #content section.profile section.markdown ul.process li p {
      padding: 16px;
      margin: 0;
      width: 127px;
      height: 127px;
      font: bold 13px DIN, "Helvetica Neue", Arial, Helvetica, sans-serif;
      line-height: 24px;
      text-transform: uppercase;
      -webkit-font-smoothing: antialiased;
      color: #555;
      letter-spacing: 1px;
      color: #ccc;
      transition: all 0.15s ease;
      -webkit-transition: all 0.15s ease;
      -moz-transition: all 0.15s ease;
      -o-transition: all 0.15s ease;
    }

<dl class='comparison'>
  <dt>Stylus Character Count</dt>
  <dd><span>337</span></dd>
  <dt>CSS Character Count</dt>
  <dd><span>1369</span></dd>
</dl>

## Convinced yet?

I have only grazed the surface of what's possible with the immense power of [Stylus](http://learnboost.github.com/stylus/), and it makes me excited about what I'll playing with in the near future.
