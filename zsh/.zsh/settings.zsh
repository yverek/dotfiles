# PyEnv Settings
if command -v pyenv &> /dev/null; then
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi

# Python Path
PYTHON_BIN_PATH="$(python3 -m site --user-base)/bin"
export PATH="$PYTHON_BIN_PATH:$PATH"

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

# Completion for kitty
if command -v kitty &> /dev/null; then
    kitty + complete setup zsh | source /dev/stdin
fi
