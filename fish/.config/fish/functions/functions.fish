#--------------------#
# Updating functions #
#--------------------#
function update_arch -d 'Update Arch (pacman and yay)'
    sudo pacman -Syu
    yay -Syu
end

function update_vimplug -d 'Update vimplug with its plugins'
    nvim +PlugUpdate +sleep 1000m +qall
end

function update_pyenv -d 'Update pyenv with its plugins'
    pyenv update
end

function update_system -d 'Update everything'
    update_arch
    sleep 1
    update_pyenv
    sleep 1
    #update_zplug
    sleep 1
    update_vimplug
end

#-------------------#
# General functions #
#-------------------#
function take -d 'Create a directory and set CWD'
    command mkdir $argv
    if test $status = 0
        switch $argv[(count $argv)]
            case '-*'

            case '*'
                cd $argv[(count $argv)]
                return
        end
    end
end

function fish_greeting
    neofetch
end
