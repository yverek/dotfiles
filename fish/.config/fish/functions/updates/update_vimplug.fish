function update_vimplug -d 'Update vimplug with its plugins'
    print_warning "We are going to update vimplug!"
    sleep 1
    nvim +PlugUpdate +sleep 1000m +qall
    sleep 1
    print_success "Done"
end
