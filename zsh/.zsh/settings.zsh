# Dircolors Settings
eval $(dircolors /home/yverek/.dir_colors/dircolors)

# PyEnv Settings
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# Snap Settings
export PATH="/snap/bin:$PATH"

# NVM Settings
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# ZSH AutoSuggestions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=6'

# Zsh Alias Tips
export ZSH_PLUGINS_ALIAS_TIPS_TEXT='ﯦ '

# Neofetch's Settings
if [ "$(pyenv version-name)" == "system" ]; then
    neofetch;
fi
