dotfiles
========

Here is my dotfiles !

I'm using `stow` to manage my dots.


To import them:
`stow <package>`


example:
```
stow neovim
stow tmux
stow i3
```


A Makefile is disponible (but you have to configure it), it's easily portable to your configuration, feel free to copy/custom!
The benifit of this file is the machine-specific files that are auto-linked/fixed (ex: polybar).


I recommand you to use [this](https://github.com/rotsix/bin/blob/master/themer) small script I did to manage my themes.

