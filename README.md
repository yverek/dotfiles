# Yverek's dotfiles
This is my personal collection dotfiles for configuring a development environment based on 
[Arch Linux](https://www.archlinux.org). :computer:

## Table of Contents
  * [Details](#details)
  * [Requirements](#requirements)
  * [Installation](#Installation)
    * [Makefile](#makefile)
    * [Manual](#manual)
  * [Updating](#updating)
  * [Thanks](#thanks)

## Details
  * CLI
    * [Git](https://git-scm.com)
    * [htop](https://hisham.hm/htop)
    * [Neofetch](https://github.com/dylanaraps/neofetch)
    * [Zsh](https://github.com/zsh-users/zsh)
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

Now you can install using Makefile or manually.

### Makefile
Run
```bash
$ make install
```
To install every packages with a single command!

This will create backup files, if you want to remove them run
```bash
$ make clean_backup
```

If you want more information about Makefile, just run
```bash
$ make
```

### Manual
You can install every package you want using just [stow](https://www.gnu.org/software/stow)
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