function update_pyenv -d 'Update pyenv with its plugins'
    print_warning "We are going to update pyenv!"
    sleep 1
    pyenv update
    sleep 1
    print_success "Done"
end
