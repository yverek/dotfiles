# Yverek's dotfiles
This is my personal collection of files and dotfiles for configuring a development environment based on 
[Debian](https://www.debian.org/).

## Table of Contents
 * [How it Works](#how-it-works)
 * [Software](#software)
 * [Installation](#Installation)
 * [Updating](#updating)
 * [license](#license)

## How it Works

## Software


## Installation
```bash
$ cd ~ && mkdir .dotfiles && cd .dotfiles
$ git clone git@github.com:yverek/dotfiles.git .
```

Use [stow](https://www.gnu.org/software/stow/) to symlink dotfiles
```bash
$ stow zsh
$ sudo stow zsh -t /root # if you want your zsh's dotfiles for root user
```

To remove dotfiles:

```bash
$ stow -D zsh
```

## Updating
```bash
$ cd ~/.dotfiles
$ git pull origin master
```

## License