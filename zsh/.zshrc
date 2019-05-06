# ============================== #
#             General            #
# ============================== #

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

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -v



# ============================== #
#            Variables           #
# ============================== #

if command -v firefox &> /dev/null; then
    BROWSER="firefox"
fi
if command -v nvim &> /dev/null; then
    EDITOR="nvim"
fi



# ============================== #
#              zplug             #
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
zplug "lukechilds/zsh-nvm"
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



# ============================== #
#         External Files         #
# ============================== #

source .zsh/options.zsh
source .zsh/aliases.zsh
source .zsh/powerlevel10k.zsh
source .zsh/settings.zsh
