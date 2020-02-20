# SSH
    ├── .config
    │   └── systemd
    │       └── user
    │           └── ssh-agent.service
    └── .pam_environment

## Requirements
- `OpenSSH` <<https://www.openssh.com>>
- `A pair of SSH key`

## Installation
First of all, copy your SSH keys (public and private) into `~/.ssh` folder.\
Now install this package with

    $ stow ssh
    $ systemctl --user enable --now ssh-agent
    $ ssh-add ~/.ssh/{your_key}
    $ ssh-add -l  # check if key has been added to ssh-agent
