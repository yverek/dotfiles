source $__fish_config_dir/settings.fish
source $__fish_config_dir/functions.fish
source $__fish_config_dir/paths.fish
source $__fish_config_dir/aliases.fish
source $__fish_config_dir/completions.fish

# pyenv
status --is-interactive; and source (pyenv init - | psub)

# starship
starship init fish | source
