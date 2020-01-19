function path_remove -d 'Remove entries from PATH'
  for entry in $argv
    while set i (contains -i $entry $PATH)
      set -e PATH[$i]
    end
  end
end