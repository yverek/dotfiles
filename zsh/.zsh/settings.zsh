# Dircolors Settings
eval $(dircolors /home/yverek/.dir_colors/dircolors)

# PyEnv Settings
if which pyenv > /dev/null; then
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi

# Snap Settings
if [ -d "/snap/bin" ]; then
  export PATH="/snap/bin:$PATH"
fi

# Zsh AutoSuggestions
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=6'

# Zsh Alias Tips
export ZSH_PLUGINS_ALIAS_TIPS_TEXT='ﯦ '

# Neofetch
if [ "$(pyenv version-name)" == "system" ]; then
    if which neofetch > /dev/null; then
        neofetch;
    fi
fi
