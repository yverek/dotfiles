# core
if command --search nvim > /dev/null
    set -gx EDITOR nvim
end

if command --search firefox > /dev/null
    set -gx BROWSER firefox
end

if command --search kitty > /dev/null
    set -gx TERMINAL kitty
end

# XGD
set -gx XDG_CONFIG_HOME $HOME/.config

# pyenv
set -gx PYENV_ROOT $HOME/.pyenv

# pipenv
set pipenv_fish_fancy yes