# ============================== #
#      Changing Directories      #
# ============================== #

# If a command is issued that can’t be executed as a normal command, and the
# command is the name of a directory, perform the cd command to that directory
setopt auto_cd

# Make cd push the old directory onto the directory stack.
setopt auto_pushd

# Resolve symbolic links to their true values when changing directory
setopt chase_links

# Don’t push multiple copies of the same directory onto the directory stack. 
setopt pushd_ignore_dups

# Exchanges the meanings of '+' and '-' when used with a number to specify a directory in the stack.
setopt pushd_minus

# Have pushd with no arguments act like 'pushd $HOME'.
setopt pushd_to_home


# ============================== #
#           Completion           #
# ============================== #

# Automatically list choices on an ambiguous completion
setopt auto_list

# Intelligently add a space after variable completion.
setopt auto_param_keys

# Intelligently add a slash after directory completion.
setopt auto_param_slash

# Remove trailing slash if next char is a word delimiter
setopt auto_remove_slash

# Treat aliases as distinct commands
setopt complete_aliases

# Completions happen at the cursor's location.
setopt complete_in_word

# Tab completion expands globs
setopt glob_complete

# Ensure the command path is hashed before completion
setopt hash_list_all

# Try to make the completion list smaller by printing the matches in columns with different widths
setopt list_packed

# When listing files that are possible completions, show the type of each file with a trailing identifying mark
setopt list_types

# Expand first match and use the interactive menu
setopt menu_complete


# ============================== #
#     Expansion and Globbing     #
# ============================== #

# Use additional glob operators ('#', '~', and '^').
setopt extended_glob

# Enable globbing (i.e. the use of the '*' operator).
setopt glob

# Mark directories resulting from globs with trailing slashes
setopt mark_dirs

# If a glob fails, the command isn't executed
setopt nomatch


# ============================== #
#             History            #
# ============================== #

# Save each command’s beginning timestamp (in seconds since the epoch) and the duration (in seconds) to the history file
setopt extended_history

# Ignore all duplicates when writing history
setopt hist_ignore_all_dups

# Ignore commands that begin with spaces
setopt hist_ignore_space

# Remove superfluous blanks from each command line being added to the history list
setopt hist_reduce_blanks

# Write commands to history file as soon as possible.
setopt inc_append_history


# ============================== #
#          Input/Output          #
# ============================== #

# Prevent '>' from clobbering files. Use '>!' to clobber.
setopt no_clobber

# Offer to correct the spelling of commands
setopt correct

# Allow comments in interactive shells
setopt interactive_comments

# Perform a $PATH search even on command names with slashes in them
setopt path_dirs

# If querying the user before executing 'rm *' or 'rm path/*', first wait ten seconds and ignore anything typed in that time
setopt rm_star_wait

# Enable short loop syntax: 'for <var> in <seq>; <command>'
setopt short_loops


# ============================== #
#        Shell Emulation         #
# ============================== #

# Allow '>>' to create a file
setopt append_create


# ============================== #
#          Job Control           #
# ============================== #

# When suspended jobs are disowned, resume them in the bg
setopt auto_continue

# Single-word simple commands are candidates for resumption
setopt auto_resume

# Run background jobs at lower priority
setopt bg_nice 

# Warn about suspended jobs on exit
setopt check_jobs

# Print job notifications in the long format by default
setopt long_list_jobs


# ============================== #
#      Scripts and Functions     #
# ============================== #

# Do not allow 'break' etc. to propogate outside function scope
setopt local_loops


# ============================== #
#              Zle               #
# ============================== #

# The shell shouldn't beep on ZLE errors (most beeps)
setopt no_beep

# Use ZLE
setopt zle
