#############################################################
# Display options
#   -1, --oneline: display one entry per line
#   -G, --grid: display entries as a grid (default)
#   -l, --long: display extended details and attributes
#   -R, --recurse: recurse into directories
#   -T, --tree: recurse into directories as a tree
#   -x, --across: sort the grid across, rather than downwards
#   -F, --classify=(when): display type indicator by file names (always, auto, never)
#   --colo[u]r=(when): when to use terminal colours (always, auto, never)
#   --colo[u]r-scale=(field): highlight levels of field distinctly(all, age, size)
#   --color-scale-mode=(mode): use gradient or fixed colors in --color-scale. valid options are fixed or gradient
#   --icons=(when): when to display icons (always, auto, never)
#   --hyperlink: display entries as hyperlinks
#   --absolute=(mode): display entries with their absolute path (on, follow, off)
#   -w, --width=(columns): set screen width in columns
#############################################################
# Filtering options
#   -a, --all: show hidden and 'dot' files
#   -d, --list-dirs: list directories like regular files
#   -L, --level=(depth): limit the depth of recursion
#   -r, --reverse: reverse the sort order
#   -s, --sort=(field): which field to sort by
#   --group-directories-first: list directories before other files
#   -D, --only-dirs: list only directories
#   -f, --only-files: list only files
#   --git-ignore: ignore files mentioned in .gitignore
#   -I, --ignore-glob=(globs): glob patterns (pipe-separated) of files to ignore
#############################################################

function eza
    set -l param -l --icons=always --group-directories-first
    command eza $param $argv
end

function ls
    eza $argv
end

function l
    eza -a $argv
end

function ltree
    eza -Ta $argv
end
