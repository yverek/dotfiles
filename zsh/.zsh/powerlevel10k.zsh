# ============================== #
#        General Settings        #
# ============================== #

POWERLEVEL9K_MODE='nerdfont-complete'

# Prompt
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%(?:%F{green}\uF460\uF460\uF460 :%F{red}\uF460\uF460\uF460 )"

# Separators
POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR='\uE0B0'
POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR='\uE0B2'
POWERLEVEL9K_LEFT_SUBSEGMENT_SEPARATOR=''
POWERLEVEL9K_RIGHT_SUBSEGMENT_SEPARATOR=''

# ============================== #
#          Left Settings         #
# ============================== #

# Prompt
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon custom_virtualenv dir vcs)

# OS Icon
POWERLEVEL9K_OS_ICON_BACKGROUND="white"
POWERLEVEL9K_OS_ICON_FOREGROUND="blue"

# Custom Virtualenv
custom_virtualenv() {
    if [ ! -z "$VIRTUAL_ENV" ]; then
        echo -n '\ue235 ';
        echo -n "$(basename $VIRTUAL_ENV | cut -f1 -d"-")"; # delete hash from Pipenv venv names
    fi
}
POWERLEVEL9K_CUSTOM_VIRTUALENV="custom_virtualenv"
POWERLEVEL9K_CUSTOM_VIRTUALENV_FOREGROUND="white"
POWERLEVEL9K_CUSTOM_VIRTUALENV_BACKGROUND="green4"

# Dir
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
POWERLEVEL9K_SHORTEN_DELIMITER=..

# ============================== #
#         Right Settings         #
# ============================== #

# Prompt
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status command_execution_time background_jobs pyenv time)

# Command Execution Time
POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=0
POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND='black'
POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND='white'

# Background Jobs
POWERLEVEL9K_BACKGROUND_JOBS_BACKGROUND="black"
POWERLEVEL9K_BACKGROUND_JOBS_FOREGROUND="white"

# PyEnv
POWERLEVEL9K_PYTHON_ICON='\uf820'
POWERLEVEL9K_PYENV_BACKGROUND="green4"
POWERLEVEL9K_PYENV_FOREGROUND="white"

# Time
POWERLEVEL9K_TIME_FORMAT="%D{\uf017 %H:%M \uf073 %d/%m/%Y}"
POWERLEVEL9K_TIME_BACKGROUND='white'
POWERLEVEL9K_TIME_FOREGROUND='black'
POWERLEVEL9K_TIME_ICON=''
