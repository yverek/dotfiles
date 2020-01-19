function update_arch -d 'Update Arch (pacman and yay)'
    sudo pacman -Syu
    sleep 1
    yay -Syu
end