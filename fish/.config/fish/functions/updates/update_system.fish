function update_system -d 'Update everything'
    update_arch
    sleep 1
    update_fisher
    sleep 1
    update_vimplug
end
