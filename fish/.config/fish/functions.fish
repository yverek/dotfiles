# PATH functions
function path_append -d 'Append entries to PATH'
  for entry in $argv
    set i (contains -i $entry $PATH); and set -e PATH[$i]
    test -e $entry; and set -a PATH $entry
  end
end

function path_dedupe -d 'Deduplicate PATH (prefers first entry)'
  set PATH (string escape $PATH | awk '!seen[$0]++')
end

function path_list -d 'Lists elements in PATH (newline seperated)'
  string escape $PATH
end

function path_prepend -d 'Prepend entries to PATH'
  for entry in $argv[-1..1]
    set i (contains -i $entry $PATH); and set -e PATH[$i]
    test -e $entry; and set -p PATH $entry
  end
end

function path_remove -d 'Remove entries from PATH'
  for entry in $argv
    while set i (contains -i $entry $PATH)
      set -e PATH[$i]
    end
  end
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

function fish_greeting
    neofetch
end

function update_arch
    sudo pacman -Syu
    yay -Syu
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
