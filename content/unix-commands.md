---
title: Useful Unix Commands
category: Development
date: 2014-01-30
---

Here are some terminal snippets I like to keep at hand. The most useful commands can be easily forgotten because you just don't use them enough.

## source

Want your Vim configuration on another computer? Consider checking it into source control. Then, add this line to your `~/.vimrc` file.

    source /your-git-repo/vimrc

## zmv

If you're using zsh, you should know it comes with zmv. Here's how to remove a prefix from a bunch of files.

    zmv 'prefix-(*)' '$1'

## recursively delete specific file or folder

For a particular folder:

    find . -type d -name '.git' -print -exec rm -rf {} \;

For a particular file:

    find . -name '.DS_Store' -print -exec rm -rf {} \;
