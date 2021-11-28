# -F = display type indicator by file names
# -g = list each file's group
# -h = add a header row to each column
# -l = display extended file metadata as a table
# --color=always            = when to use terminal colours
# --color-scale             = highlight levels of file sizes distinctly
# --icons                   = display icons
# --group-directories-first = list directories before other files
function exa
    set -l param -Fghl --color=always --color-scale --icons --group-directories-first
    command exa $param $argv
end

function ls
    exa $argv
end

# -a = show hidden and 'dot' files
function l
    exa -a $argv
end

# -T = recurse into directories as a tree
function ltree
    exa -Ta $argv
end
