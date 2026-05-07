#! bash oh-my-bash.module
#
# EVA-02 Theme 🔴🧡
# Inspired by Evangelion Unit-02
# Production Model Crimson! 🚀

# --- EVA-02 Palette ---
# We wrap escape codes in \[ and \] so Bash doesn't get confused about prompt length!
EVA02_RED='\[\e[38;2;237;35;35m\]'
EVA02_ORANGE='\[\e[38;2;234;133;51m\]'
EVA02_BG='\[\e[38;2;40;29;45m\]'
EVA02_PEACH='\[\e[38;2;251;230;229m\]'
EVA02_LIGHT_ORANGE='\[\e[38;2;249;157;82m\]'
EVA02_RESET='\[\e[0m\]'

SCM_NONE_CHAR=''
SCM_THEME_PROMPT_DIRTY=" \[${_omb_prompt_bold_brown}\]✗"
SCM_THEME_PROMPT_CLEAN=""
SCM_THEME_PROMPT_PREFIX="\[${EVA02_LIGHT_ORANGE}\]["
SCM_THEME_PROMPT_SUFFIX="\[${EVA02_LIGHT_ORANGE}\]]"
SCM_GIT_SHOW_MINIMAL_INFO=true

function _omb_theme_PROMPT_COMMAND() {
    local RC="$?"

    # Status markers
    local status_marker
    if [[ ${RC} == 0 ]]; then
        status_marker="\[${EVA02_RED}\]●${EVA02_RESET}"
    else
        status_marker="\[${_omb_prompt_bold_brown}\]●${EVA02_RESET}"
    fi

    local python_info=""
    local python_venv; _omb_prompt_get_python_venv
    if [[ -n $python_venv ]]; then
        python_info="${EVA02_ORANGE}(py:${python_venv}) ${EVA02_RESET}"
    fi

    local conda_info=""
    if [[ -n "${CONDA_DEFAULT_ENV}" ]]; then
        conda_info="${EVA02_ORANGE}(conda:${CONDA_DEFAULT_ENV}) ${EVA02_RESET}"
    fi

    local docker_info=""
    if [[ -f /.dockerenv ]]; then
        docker_info="${EVA02_ORANGE}(docker) ${EVA02_RESET}"
    fi

    local user_host="${EVA02_RED}\u@\h${EVA02_RESET}"
    local current_dir="${EVA02_ORANGE}\w${EVA02_RESET}"
    
    # Construction of the command line
    PS1="${status_marker} ${python_info}${conda_info}${docker_info}${user_host} ${current_dir} $(scm_prompt_char_info)\n${EVA02_RED}»${EVA02_RESET} "
}

_omb_util_add_prompt_command _omb_theme_PROMPT_COMMAND
