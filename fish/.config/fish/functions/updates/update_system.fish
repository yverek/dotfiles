function update_system -d 'Update everything'
    update_ubuntu
    sleep 1
    update_pyenv
    sleep 1
    update_fisher
    sleep 1
    update_vimplug
end
