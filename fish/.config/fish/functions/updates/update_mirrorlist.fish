function update_mirrorlist -d 'Update mirrorlist using Reflector'
    sudo reflector --country "Italy" --latest 10 --number 10 --protocol http --sort rate --save /etc/pacman.d/mirrorlist
end