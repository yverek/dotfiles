# load utility functions
source $__fish_config_dir/utilities.fish

# check if every software this fish configuration needs it's installed on the system
set -q IS_FISH_INSTALLATION_OK; or source $__fish_config_dir/check_installations.fish
if not set -q IS_FISH_INSTALLATION_OK
    error "Please check your Fish installation before continue!"
    exit -1
end

# load environment variables
source $__fish_config_dir/env_variables.fish

# load aliases and completions files
for file in $__fish_config_dir/{aliases,completions}/*
    source $file
end

# load functions
for file in $__fish_config_dir/functions/{generals,paths,updates}/*
    source $file
end

# start pyenv
status is-login; and pyenv init --path | source
status is-interactive; and pyenv init - | source

# start starship
starship init fish | source
