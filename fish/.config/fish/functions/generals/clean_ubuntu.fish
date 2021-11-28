function clean_ubuntu -d 'Clean Ubuntu installation deleting unneeded packages and unused dependencies'
    # getting amount of space we are going to clean
    set -l FREE_SPACE (string trim (string split '/' (sudo du -sh /var/cache/apt/archives))[1])
    print_warning "We are going to delete .deb packages for a total of $FREE_SPACE!"
    sudo apt clean
    sleep 1
    print_success "Done"
end
