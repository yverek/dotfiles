# General
function ppath
    printf "%s\n" $PATH  # print $PATH line by line
end

# Create a directory and set CWD
function take
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

function update_arch
    sudo pacman -Syu
end

function update_zplug
    zplug update
end

function update_vimplug
    nvim +PlugUpdate +sleep 1000m +qall
end

function update_pyenv
    pyenv update
end

function update_system
    update_arch
    sleep 1
    update_pyenv
    sleep 1
    update_zplug
    sleep 1
    update_vimplug
end
