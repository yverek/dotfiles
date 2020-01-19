source $__fish_config_dir/settings.fish

# functions subdirectories
for file in $__fish_config_dir/functions/{general,paths,updates}/*
    source $file
end

source $__fish_config_dir/paths.fish
source $__fish_config_dir/aliases.fish

# completions subdirectories
for file in $__fish_config_dir/completions/*
    source $file
end

# pyenv
status --is-interactive; and source (pyenv init - | psub)

# starship
starship init fish | source

# fisher
if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end