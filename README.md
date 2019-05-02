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
   * [Zsh](https://github.com/zsh-users/zsh)
     * [zplug](https://github.com/zplug/zplug)
     * [Powerlevel10k](https://github.com/romkatv/powerlevel10k)
 * GUI

TODO: complete this section

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

First of all, clone this repository
```bash
$ git clone git@github.com:yverek/dotfiles.git ~/.dotfiles
```

Before install anything, you **must** install the `stow` package: check its [README](stow/README.md)!

Then, you can install every package you want, using [stow](https://www.gnu.org/software/stow)
```bash
$ cd ~/.dotfiles
$ stow zsh
```
> Remember to check `READMEs` to get more information about installing packages!
 
To remove dotfiles
```bash
$ cd ~/.dotfiles
$ stow -D zsh
```

## Updating
```bash
$ cd ~/.dotfiles && git pull origin master
```

## Thanks
Many thanks to the entire [dotfiles community](http://dotfiles.github.io). :heart: