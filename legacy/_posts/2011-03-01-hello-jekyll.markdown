---
layout: en-article
category: en-articles
title: Built with git, vi, and Jekyll.
---

I've migrated this site to [Jekyll](https://github.com/mojombo/jekyll). It seems much easier to use than ExpressionEngine. Of course, you have to be comfortable in text editors and SSH. I can't stand textareas on the web anymore. It feels so slow and unwieldy. Developer notes follow.

March 3rd: Why are post summaries so difficult to pull off? I might have to migrate to Nanoc instead. Update: for the meantime, I've decided to not use post summaries.

## Lightboxes fundamentally broken

March 4th: A bit of a tangent, but I'm finding that lightbox scripts are fundamentally broken. The popup windows don't respond to keyboard shortcuts, and images never show up until they're 100% loaded. I don't think script writers understand how nice it is to see part of an image as it loads.

It lets you decided whether to finish loading or skip ahead to another picture. A loading GIF doesn't give any information at all, and just pisses people off.

The popup effect also takes you out of the flow of the original article. Usually, a lightboxed image is in reference to something you're reading. But by clicking on it, you're effectively hiding the content for the picture.

It's a pain, and that's why almost all power users open images in new tabs instead. Sure, it can get can confusing trying to link an image tab to what you're reading. But at least it doesn't obscure everything.
