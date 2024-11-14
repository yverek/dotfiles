# load utility functions
source $__fish_config_dir/utilities.fish

# load environment variables
source $__fish_config_dir/env_variables.fish

# load aliases and completions files
for file in $__fish_config_dir/aliases/*
    source $file
end

# load functions
for file in $__fish_config_dir/functions/{generals,paths,updates}/*
    source $file
end

# start starship
starship init fish | source
