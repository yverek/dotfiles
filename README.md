# Yverek's dotfiles
This is my personal collection of files and dotfiles for configuring a development environment based on 
[Debian](https://www.debian.org/).

## Table of Contents
 * [How it Works](#how-it-works)
 * [Details](#details)
 * [Prerequisites](#prerequisites)
 * [Installation](#Installation)
   * [Software](#software)
   * [Dotfiles](#dotfiles)
 * [Updating](#updating)
 * [Thanks](#thanks)

## How it Works
You can install all the software just running `software/bootstrap.sh` file.

With [stow](https://www.gnu.org/software/stow/), you can symlink all of the dotfiles into your $HOME directory.
You can update your dotfiles with `git pull`!

## Details
 * CLI
   * [Zsh](https://github.com/zsh-users/zsh)
     * [zplug](https://github.com/zplug/zplug)
     * [Powerlevel10k](https://github.com/romkatv/powerlevel10k)
 * GUI

## Prerequisites
Make sure the following requirements are installed:

 * [Git](https://git-scm.com/)
 * [curl](https://curl.haxx.se/)
 * [GNU Stow](https://www.gnu.org/software/stow/)

Install them with
```bash
$ sudo apt install git curl stow
```

## Installation
**Warning:** If you want to give these dotfiles a try, you should first fork this repository, review the code, and
remove things you don’t want or need. Use at your own risk!

First of all, clone this repository
```bash
$ git clone git@github.com:yverek/dotfiles.git ~/.dotfiles
```

### Software
Edit `config.py` and run this

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
Just run this
```bash
$ cd ~/.dotfiles
$ git pull origin master
```

## Thanks
Many thanks to the [dotfiles community](http://dotfiles.github.io/) and the creators of the incredibly useful tools.