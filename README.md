# Yverek's dotfiles
This is my personal collection of files and dotfiles for configuring a development environment based on 
[Debian](https://www.debian.org/).

## Table of Contents
 * [How it Works](#how-it-works)
 * [Details](#details)
 * [Installation](#Installation)
   * [Software](#software)
   * [Dotfiles](#dotfiles)
 * [Updating](#updating)

## How it Works
You can install all the software just running `bootstrap.py` file.

With [stow](https://www.gnu.org/software/stow/), you can symlink all of the dotfiles into your $HOME directory.
You can update your dotfiles with a `git pull` and everything still works!

## Details
 * CLI
   * [Zsh](https://github.com/zsh-users/zsh)
     * [zplug](https://github.com/zplug/zplug)
     * [Powerlevel10k](https://github.com/romkatv/powerlevel10k)
 * GUI

## Installation
First of all, clone this repository
```bash
$ cd ~ && mkdir .dotfiles && cd .dotfiles
$ git clone git@github.com:yverek/dotfiles.git .
```

### Software
Just
```bash
$ cd ~/.dotfiles
$ python3 bootstrap.py
```

### Dotfiles
Use [stow](https://www.gnu.org/software/stow/) to symlink dotfiles on your $HOME directory
```bash
$ cd ~/.dotfiles
$ stow zsh
$ sudo stow zsh -t /root # if you want your zsh's dotfiles for root user
```

To remove dotfiles
```bash
$ cd ~/.dotfiles
$ stow -D zsh
```

## Updating
```bash
$ cd ~/.dotfiles
$ git pull origin master
```