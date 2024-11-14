function update_ubuntu -d 'Update Ubuntu installation'
    print_warning "We are going to update your Ubuntu installation!"
    sudo pacman -Syu
    sleep 1
    # TODO replace with paru
    # yay -Syu
    print_success "Done"
end
