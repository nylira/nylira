---
title: Building Snake with JavaScript in 2015
category: game-dev
date: 2015-01-27
bodyclass: article
---

I made the game Snake in JavaScript. It plays well on both PC and mobile browsers. Give it a shot! [snake.nylira.com](http://nylira.com)

<div class="figure">
  <img src="../assets/images/snake/gameplay.png" alt="Snake gameplay" />
  <div class="figcaption">
    <p>Yes, I lost this game in order to show you a screenshot.</p>
  </div>
</div>

## Controls

  There are multiple control schemes in place so you can play it however you want. For mobile, you may either tap the on screen buttons or swipe in any direction. For PC, you have the added options of WASD and arrow keys.

## High Scores

  Your high scores are persisted through your browser's localStorage. This means that this game is a purely client-side application, and can be played offline without the internet.

## Libraries

  I made great use out of the following JavaScript libraries:
  
  * [combokeys](https://github.com/mightyiam/combokeys) for keyboard shortcuts.
  * [fastclick](https://github.com/ftlabs/fastclick) to remove the 300ms delay on touch input on mobile websites.
  * [HammerJS](http://http://hammerjs.github.io/) for touch gestures.
  * [Howler](http://goldfirestudios.com/blog/104/howler.js-Modern-Web-Audio-Javascript-Library) for WebAudio sound. 
  * [pixi.js](http://www.pixijs.com/) for WebGL rendering wihttp://th a Canvas fallback.

## Source

  The source code for my Snake implementation is available on GitHub at [github.com/nylira/snake](https://github.com/nylira/snake). Feel free to take a look!

  And if you want to play it, go here: [snake.nylira.com](http://nylira.com)
