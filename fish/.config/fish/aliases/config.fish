function fish_reload -d "Reload fish shell configuration"
    source ~/.config/fish/config.fish
end

function kitty_config -d "Edit kitty terminal configuration"
    $EDITOR ~/.config/kitty/kitty.conf
end

function fastfetch_config -d "Edit neofetch configuration"
    $EDITOR ~/.config/fastfetch/config.jsonc
end

function vim_config -d "Edit nvim configuration"
    $EDITOR ~/.config/nvim/init.vim
end
