# GPG
    └── .gnupg
        ├── gpg.conf
        └── gpg-agent.conf


## Requirements
- `GnuPG` <<https://www.gnupg.org>>
- `GPG subkeys` <Authenticate `A`, Sign `S` and Encrypt `E`>

## Installation
First of all, import your GPG subkeys.

    $ gpg --import {your_keys_uid}.sub_priv.asc
    
Now install this package with

    $ stow gpg
