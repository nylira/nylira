---
title: Maze Generation in Unreal Engine 4
category: game-dev
date: 2014-04-27
bodyclass: article
---

I'm developing an Action RPG from scratch using Unreal Engine 4. I switched recently from Unity due to UE4's source code access and vastly superior performance. Here's the progress with the dungeon generation so far.

First, I worked on implementing the Growing Tree algorithm with Unreal Blueprint. I learned a lot about maze generation algorithms from [Jamis Buck](http://weblog.jamisbuck.org/2011/2/7/maze-generation-algorithm-recap) and [Think Labyrinth](http://www.astrolog.org/labyrnth/algrithm.htm).

<div class='figure max'>
  <img src="../assets/images/arpg/grid-small.png" alt="Grid small" />
  <div class='figcaption'>The grid generated with 10x10 settings.</div>
</div>

<div class='figure max'>
  <img src="../assets/images/arpg/grid-large.png" alt="Grid large" />
  <div class='figcaption'>The grid generated with 14x14 settings.</div>
</div>

## Tile Tests

I haven't decided what setting to use for the game yet. I'm experimenting with tile designs to see what looks good from a top-down perspective:

<div class='figure max'>
  <img src="../assets/images/arpg/scifi-tiles.jpg" alt="Scifi tiles" />
  <div class='figcaption'>Some prototype map tiles rendered in Modo 801.</div>
</div>
