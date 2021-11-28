# core
set -gx XDG_CONFIG_HOME $HOME/.config

# default software
set -gx EDITOR nvim
set -gx BROWSER firefox
set -gx TERMINAL kitty

# Python and its environment
set pipenv_fish_fancy yes

# Fish Colored Man plugin as "Solarized Dark & Green highlight"
set -g man_blink -o red
set -g man_bold -o green
set -g man_standout -b black 93a1a1
set -g man_underline -u 93a1a1

# private environment variables
set -g DOTFILES ~/.dotfiles
set -g HONEYPOT ~/.honeypot

# work environment variables
set -g SKY_FOLDER ~/Sky
set -g MY_ACCOUNT_POC "$SKY_FOLDER/my-account-poc"
set -g BILLING "$SKY_FOLDER/my-account-billing"
set -g SKY_IT_HTTP_MANAGER "$SKY_FOLDER/sky-it-http-manager"
