# folder creations
alias md 'mkdir -p'
alias rd rmdir

# haters gonna hate
if command --search nvim > /dev/null
    alias vim nvim
end

# ls on steroids
if command --search exa > /dev/null
    alias l 'exa -Fghla --group-directories-first'
    alias ls 'exa -Fghl --group-directories-first'
    alias ltree 'exa -FghTl --group-directories-first'
end

# fish
alias fish_reload 'source ~/.config/fish/config.fish'

# config files
alias kittyconfig '$EDITOR ~/.config/kitty/kitty.conf'
alias neofetchconfig '$EDITOR ~/.config/neofetch/config.conf'
alias vimconfig '$EDITOR ~/.config/nvim/init.vim'

