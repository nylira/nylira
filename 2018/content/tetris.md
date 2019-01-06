---
title: Designing Tetris for mobile devices in JavaScript
category: game-dev
date: 2015-03-16
bodyclass: article
---

I made Tetris in JavaScript. It plays well on both PC and mobile browsers. Give it shot in fullscreen [here](http://tetris.nylira.com). Or play the embedded version below.

<iframe src="http://tetris.nylira.com" width="360" height="640"></iframe>

## High Scores

Your high scores are persisted through your browser's localStorage. This means that this game is a purely client-side application, and can be played offline without the internet.

## Libraries

I made great use out of these JS libraries:

* [Combokeys](https://github.com/mightyiam/combokeys) for keyboard shortcuts.
* [Pixi.js](http://www.pixijs.com/) as my 2D rendering engine.

## Source

The source code for my Tetris implementation is available on GitHub at [github.com/nylira/tetris](https://github.com/nylira/tetris). Feel free to take a look!

And if you want to play it, go here: [tetris.nylira.com](http://nylira.com)
