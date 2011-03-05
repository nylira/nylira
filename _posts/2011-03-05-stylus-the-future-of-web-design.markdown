---
layout: en-article
category: en-articles
title: Stylus, the Future of Web Design
---

About a month ago, [Stylus](http://learnboost.github.com/stylus) was released, to little fanfare. 

It has quickly become my favorite web development tool. Cleaner and more flexible than [Sass](http://sass-lang.com/), Stylus is by far the best CSS preprocessor in the wild today. If you're unfamiliar with preprocessors, just imagine adding variables, functions, and simple arithmetic to CSS. While the additions may seem daunting to beginners, these advanced abstractions were desperately needed by the maintainers of complex stylesheets.

Stylus strips away all colons, semicolons, brackets and most parentheses from regular CSS script. The stark simplicity and elegance reminds me of Lisp. What's more amazing is that Stylus will also accept regular CSS syntax in the same file, reducing possible friction between multiple contributers.

Here's a sample of Stylus, a bit of code that powers this very site:

    section.markdown
      aside
        col 4
        ml - c4
        h2
          alt-font()
          color anchor
          mb  m
        ul
          list-style none

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

You'll notice that I've trimmed down many CSS properties: `background` is now `bg`, `border-color` is `bc`, `margin-left` is `ml`, etc. Where I used to use `margin 0 0 2em` (which was less characters than `margin-left 2em`), I now use `mb 2em`. This feature alone saves countless amount of wasteful typing.

I have only grazed the surface of what's possible with the immense power of Stylus, and it makes me excited about the future of design. 
