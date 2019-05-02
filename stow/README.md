# Stow
    ├── .stow-global-ignore
    └── .stowrc

## Requirements
- `Stow` <<https://www.gnu.org/software/stow>>

## Installation
Before install this package, change `.stowrc` with your $HOME path.

    $ rm -f ~/.stowrc ~/.stow-global-ignore
    $ stow stow -t ~

> **Important:** Stow should be the first package you install as it is responsible for filtering all the files that you
  don't need when you stow a package.
