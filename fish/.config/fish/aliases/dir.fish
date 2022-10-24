function md -d 'Create a directory silently'
    mkdir -p $argv
end

function rd -d 'Remove an empty directory'
    rmdir $argv
end

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

function dotfiles -d 'Cd into .dotfiles directory'
    cd ~/.dotfiles
end
