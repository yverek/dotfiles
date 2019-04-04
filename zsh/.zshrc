source ~/.dotfiles/zsh/.zsh/powerlevel10k.zsh
source ~/.dotfiles/zsh/.zsh/settings.zsh
source ~/.dotfiles/zsh/.zsh/aliases.zsh
source ~/.dotfiles/zsh/.zsh/options.zsh

# Set up the prompt
autoload -Uz promptinit
promptinit

# Set up the history size and location
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2

# Activate color-completion
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false

# Provide verbose completion information
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# ============================== #
#             zplug              #
# ============================== #

source ~/.zplug/init.zsh

# zplug manages itself
zplug 'zplug/zplug', hook-build:'zplug --self-manage'

# oh-my-zsh plugins
zplug "plugins/django", from:oh-my-zsh
zplug "plugins/extract", from:oh-my-zsh
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/pyenv", from:oh-my-zsh

# zsh-users plugins
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"

# other plugins
zplug "djui/alias-tips"
zplug "zdharma/fast-syntax-highlighting"
zplug "zlsun/solarized-man"
zplug 'anonguy/yapipenv.zsh'

# powerlevel10k theme
zplug "romkatv/powerlevel10k", use:powerlevel10k.zsh-theme

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load
