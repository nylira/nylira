---
title: Optimize your PNG images in under 80 seconds
category: web-dev
date: 2015-01-21
bodyclass: article
---

Contributors to prism-break.org have been adding software logos from everywhere around the internet. Almost none of them are fully optimized for quick user downloads.

## Enter pngcrush
 
pngcrush is a command line tool that attempts to reduce the file size of your PNG files losslessly. It does this by attempting a large number of compression methods and comparing their results to see which offers the greatest file size reduction.

Smaller file sizes mean a snapper user experience. It also improves your search rankings in Google.

Install pngcrush with npm:

    npm install pngcrush

## Using pngcrush on a single PNG file

Let's try using pngcrush on Gentoo Linux's famous "g" logo. You can find a PNG version of it on [their website](https://www.gentoo.org/main/en/name-logo.xml).

<div class="figure">
  <img src="../assets/images/pngcrush/gblend.png" alt="Gentoo Linux logo" />
  <div class="figcaption">
    <p>The Gentoo Linux logo. Size: 1,109,332 bytes</p>
  </div>
</div>

This is the command we'll use:
    
    pngcrush -rem allb -brute -reduce gblend.png gentoo.png

These are the results I get:

    Best pngcrush method        = 112 (ws 15 fm 5 zl 8 zs 1) =    863400
    for output to gentoo.png
    (22.17% critical chunk reduction)
    (22.17% filesize reduction)
    CPU time decoding 4.954, encoding 74.960, other 0.022, total 79.935 sec.

And here is the optimized version of the logo:

<div class="figure">
  <img src="../assets/images/pngcrush/gblend-optimized.png" alt="Gentoo Linux logo (optimized)" />
  <div class="figcaption">
    <p>The Gentoo Linux logo after being pngcrushed. Size: 863,400 bytes</p>
  </div>
</div>

There is no visual difference, but the file is 864 KB instead of 1.1 MB. That's 22% less transfer required for your users. Isn't that great!

## Using pngcrush to recursively crush directories of PNG files

I use this following command ([found here](http://www.commandlinefu.com/commands/view/10996/pngcrush-all-.png-files-in-the-directory)) to recursively crush all the images in the assets folder of my PRISM Break project.

    find -f . png | while read line; do pngcrush -ow -brute $line; done

The last time I ran this command, I reduced the size of my images folder from 19.3 MB to 17.6 MB. Due to the light weight of the HTML, and CSS this means that visitors to [https://prism-break.org](https://prism-break.org) will load the site nearly 9% faster. Definitely worth it.
