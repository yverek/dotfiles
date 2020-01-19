source $__fish_config_dir/settings.fish
source $__fish_config_dir/functions.fish
source $__fish_config_dir/paths.fish
source $__fish_config_dir/aliases.fish
#source $__fish_config_dir/completions.fish

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