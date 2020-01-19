function clean_arch -d 'Clean Arch from unneeded packages and unused dependencies'
    # Uninstall all unneeded packages and their unused dependencies
    sudo pacman -Rns $(pacman -Qtdq)

    # delete old version of your packages
    sudo pacman -Sc
end