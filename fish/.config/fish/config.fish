source $__fish_config_dir/aliases.fish
source $__fish_config_dir/functions.fish
source $__fish_config_dir/settings.fish

# python
set -Ux PYENV_ROOT $HOME/.pyenv
set -gx PATH $PYENV_ROOT/bin $PATH

status --is-interactive; and source (pyenv init - | psub)

# i'll wait powerlevel9k for full transfer to fish

# starship
starship init fish | source
