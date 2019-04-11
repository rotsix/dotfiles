dotfiles
========

Here are my dotfiles!

I'm using `stow` to manage my dots.


To import them:
`stow <package>`


example:
```
stow neovim
stow tmux
stow i3
```


A Makefile is available (but you have to configure it), it's easily portable to your configuration, feel free to copy/customize!
The benefit of this file is the machine-specific files that are auto-linked/fixed (ex: polybar).
