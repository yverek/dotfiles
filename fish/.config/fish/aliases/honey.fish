function dotfiles -d 'Cd into .dotfiles directory'
    cd ~/.dotfiles
end

function getHoney -d 'Bees want their honey back'
    set multiplier $argv[1]
    set base (math $argv[2] "*" $multiplier)
    set fibonacci 1 2 3 5 8 13 21 34 55 89 144 233
    set plus 1
    set file (cat $HONEYPOT/words.txt)
    set words (string split - $file)

    for element in $fibonacci
        set -a honey $words[(math $base + $element"*"$multiplier + $plus)]
    end

    # -n so we don't have a newline at the end of the string
    # -b to copy string in clipboard
    echo -n (string join '-' $honey) | xsel -b
    print_success "Done"
end
