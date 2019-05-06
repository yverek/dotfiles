# General
alias print_path='echo -e ${PATH//:/\\\n}'

# Zsh
alias zshconfig='$EDITOR ~/.zshrc'
alias open_zplug='cd ~/.zplug'
alias zshreload='source ~/.zshrc'

# Config files
alias kittyconfig='$EDITOR ~/.config/kitty/kitty.conf'
alias neofetchconfig='$EDITOR ~/.config/neofetch/config.conf'
alias vimconfig='$EDITOR ~/.config/nvim/init.vim'

# Folder navigation
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'

# Folder creation
alias md='mkdir -p'
alias rd=rmdir

function take() {
  mkdir -p $@ && cd ${@:$#}
}

# Haters gonna hate
if command -v nvim &> /dev/null; then
    alias vim='nvim'
fi

# List directory contents
if command -v exa &> /dev/null; then
    alias l='exa -Fghl --group-directories-first'
    alias ls='exa -FG --group-directories-first'
    alias la='exa -Fghla --group-directories-first'
    alias ltree='exa -FghTl --group-directories-first'
fi

# Filtering
alias grep='grep --color=auto'

# Updating
function update_arch() {
    sudo pacman -Syu
}

function update_zplug() {
    zplug update
}

function update_vimplug() {
    nvim +PlugUpdate +sleep 1000m +qall
}

function update_pyenv() {
    pyenv update
}

function update_system() {
    update_arch
    sleep 1
    update_pyenv
    sleep 1
    update_zplug
    sleep 1
    update_vimplug
}