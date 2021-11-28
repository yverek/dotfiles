function update_ubuntu -d 'Update Ubuntu installation'
    print_warning "We are going to update your Ubuntu installation!"
    sleep 1
    sudo apt update
    sleep 1
    sudo apt upgrade
    sleep 1
    print_success "Done"
end
