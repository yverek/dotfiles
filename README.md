# Yverek's dotfiles
This is my personal collection dotfiles for configuring a development environment based on 
[Arch Linux](https://www.archlinux.org). :computer:

## Table of Contents
  * [Details](#details)
  * [Requirements](#requirements)
  * [Installation](#Installation)
  * [Updating](#updating)
  * [Thanks](#thanks)

## Details
  * CLI
    * [Fish](https://github.com/fish-shell/fish-shell)
    * [Git](https://git-scm.com)
    * [GPG](https://www.gnupg.org)
    * [htop](https://hisham.hm/htop)
    * [Neofetch](https://github.com/dylanaraps/neofetch)
    * [Neovim](https://neovim.io)
    * [SSH](https://www.openssh.com)
  * GUI
    * [Albert](https://github.com/albertlauncher/albert)
    * [kitty](https://github.com/kovidgoyal/kitty)

## Requirements
Make sure the following requirements are installed:
  * [Git](https://git-scm.com)
  * [GNU Stow](https://www.gnu.org/software/stow)

Install them with
```bash
$ sudo pacman -S git stow
```

## Installation
**Warning:** If you want to give these dotfiles a try, you should first fork this repository, review the code, and
remove things you don’t want or you don't need. Use at your own risk!

Two things before proceeding:
  1. Before installing anything, you **must** install the `stow` package: check its [README](stow/README.md)!
  2. Before installing a package, remember to check `README` to get more information!

First of all, clone this repository
```bash
$ git clone https://github.com/yverek/dotfiles.git ~/.dotfiles
$ cd ~/.dotfiles
```

Now, you can install every package you want using just [stow](https://www.gnu.org/software/stow)
```bash
$ stow zsh
```
 
To remove dotfiles
```bash
$ stow -D zsh
```

## Updating
```bash
$ git pull origin master
```

## Thanks
Many thanks to the entire [dotfiles community](http://dotfiles.github.io). :heart:
