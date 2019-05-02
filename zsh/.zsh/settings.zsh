# PyEnv Settings
if command -v pyenv &> /dev/null; then
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi

# Zsh AutoSuggestions
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=6'

# Zsh Alias Tips
export ZSH_PLUGINS_ALIAS_TIPS_TEXT=" "

# Neofetch
# This check prevents Neofetch to run if a venv is activated
if command -v pyenv &> /dev/null && [[ "$(pyenv version-name)" == "system" ]]; then
    if command -v neofetch &> /dev/null; then
        neofetch;
    fi
fi