# GPG
    └── .gnupg
        ├── gpg.conf
        └── gpg-agent.conf


## Requirements
- `GnuPG` <<https://www.gnupg.org>>
- `GPG subkeys` <Authenticate `A`, Sign `S` and Encrypt `E`>

## Installation
First of all, import your GPG subkeys (if you need help, follow [this](https://blog.eleven-labs.com/en/openpgp-almost-perfect-key-pair-part-1/) guide)

    $ gpg --import {your_keys_uid}.sub_priv.asc
    
Now install this package with

    $ stow gpg
