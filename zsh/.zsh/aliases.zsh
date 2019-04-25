# General
alias zshconfig='gedit ~/.zshrc'
alias open_zplug='nautilus ~/.zplug'
alias zshreload='source ~/.zshrc'
alias print_path='echo -e ${PATH//:/\\\n}'

# Aptitude
alias search='aptitude search'
alias clean='sudo aptitude clean'
alias purge='sudo aptitude purge'
alias update='sudo aptitude update'
alias remove='sudo aptitude remove'
alias upgrade='sudo aptitude upgrade'
alias apt-install='sudo aptitude install'
alias autoremove='sudo aptitude autoremove'
alias dist-upgrade='sudo aptitude dist-upgrade'

function apt-clean() {
    sudo apt-get clean
    sudo apt-get autoclean
    sudo apt-get autoremove
}

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

# List directory contents
alias l='exa -Fghl --group-directories-first'
alias ls='exa -FG --group-directories-first'
alias la='exa -Fghla --group-directories-first'
alias ltree='exa -FghTl --group-directories-first'

# Filtering
alias grep='grep --color=auto'

