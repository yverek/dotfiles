# General
alias zshconfig='gedit ~/.zshrc'
alias open_zplug='nautilus ~/.zplug'
alias zshreload='source ~/.zshrc'
alias print_path='echo -e ${PATH//:/\\\n}'

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

