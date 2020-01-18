# core
if command --search nvim > /dev/null
    set -gx EDITOR nvim
end

if command --search firefox > /dev/null
    set -gx BROWSER firefox
end

# pyenv
set -gx PYENV_ROOT $HOME/.pyenv
