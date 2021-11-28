function update_fisher -d 'Update Fisher with its plugins'
    print_warning "We are going to update Fisher!"
    sleep 1
    fisher update
    sleep 1
    print_success "Done"
end
