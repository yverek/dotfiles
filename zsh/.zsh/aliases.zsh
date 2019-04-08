# General
alias zshconfig='gedit ~/.zshrc'
alias open_zplug='nautilus ~/.zplug'
alias zshreload='source ~/.zshrc'

# Aptitude
alias clean='sudo aptitude clean'
alias purge='sudo aptitude purge'
alias search='sudo aptitude search'
alias update='sudo aptitude update'
alias remove='sudo aptitude remove'
alias upgrade='sudo aptitude upgrade'
alias apt-install='sudo aptitude install'
alias autoremove='sudo aptitude autoremove'
alias dist-upgrade='sudo aptitude dist-upgrade'

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
alias ls='ls --color=auto'
alias lsa='ls -lah'
alias l='ls -lah'
alias ll='ls -lh'
alias la='ls -lAh'

