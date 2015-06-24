---
title: Notes on Collaboration
category: web-dev
date: 2012-09-05
bodyclass: article
---

Notes on improving communication and collaboration.

## Succintness vs Explicitness

As powerful as [Stylus](http://learnboost.github.com/stylus/) is, it's easy to go overboard with mixins.

The CSS proprocessor Stylus makes it [incredibly easy](http://nylira.com/stylus-the-revolutionary-successor-to-css/) to define transparent mixins. With symbols like $ and @ stripped away and : and ; being made unnecessary, it's simple to create your own [DSL](http://en.wikipedia.org/wiki/Domain-specific_language) on top of CSS.

This capability is immensely powerful when working solo, but it can be difficult to debug for someone else coming into your project. If you work with other designers or hand off code to an external team it's a good idea to keep mixin usage in Stylus at a bare minimum.

While this is fine to use on personal projects:

    section.markdown
      aside
        col 4
        ml - c4
        h2
          font2()
          c anchor
          mb x*2
        ul
          ls none

      ul.process
        ml -4c
        clear()
        li
          fl left
          m 0 0 1px 1px
          p
            p x
            m 0
            box c4 - x*2 - 1px
            font2()
            c #ccc
            transition()

In larger projects, it usually pays to be a little less clever:

    section.markdown
      aside
        width: col4
        margin-left: - col4
        h2
          font: font2
          color: anchor
          margin-bottom: m2
        ul
          list-style: none

      ul.process
        ml -4c
        margin-left: - col4
        clearfix()
        li
          float: left
          margin: 0 0 1px 1px
          p
            padding: x
            margin: 0
            height: col4 - x*2 - 1px
            width: col4 - x*2 - 1px
            font: font2
            color: #ccc
            transition()

While it takes longer to write out the expanded CSS, doing so will save hours of potential headaches in the future. By being a bit more explicit and a bit less obtuse, the efficiency you lose will be made up several times over if anyone else has to edit your code in the future.
