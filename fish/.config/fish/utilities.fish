function print_error -d "Log an error with red color"
    set_color -o red
    echo ">>>  $argv[1]"
    set_color normal
end

function print_warning -d "Log a success with green color"
    set_color -o yellow
    echo ">>>  $argv[1]"
    set_color normal
end

function print_success -d "Log a success with green color"
    set_color -o green
    echo ">>>  $argv[1]"
    set_color normal
end

function print_url -d "Log a message with an URL"
    set_color -o green
    echo -n ">>>  "; set_color -u; echo $argv[1]
    set_color normal
end
