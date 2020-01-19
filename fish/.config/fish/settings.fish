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

# pyenv
set -gx PYENV_ROOT $HOME/.pyenv

# XGD
set -gx XDG_CONFIG_HOME $HOME/.config