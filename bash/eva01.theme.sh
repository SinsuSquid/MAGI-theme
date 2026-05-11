#! bash oh-my-bash.module
#
# EVA-01 Theme 💜💚
# Inspired by Evangelion Unit-01
# Midnight Purple Background with Neon Green Accents! 🚀

# --- EVA-01 Palette ---
# We wrap escape codes in \[ and \] so Bash doesn't get confused about prompt length!
EVA_PURPLE='\[\e[38;2;150;95;212m\]'
EVA_GREEN='\[\e[38;2;139;212;80m\]'
EVA_BG_PURPLE='\[\e[38;2;29;26;47m\]'
EVA_MUTED_PURPLE='\[\e[38;2;115;79;154m\]'
EVA_FOREST_GREEN='\[\e[38;2;63;109;78m\]'
EVA_RESET='\[\e[0m\]'

SCM_NONE_CHAR=''
SCM_THEME_PROMPT_DIRTY=" \[${_omb_prompt_bold_brown}\]✗"
SCM_THEME_PROMPT_CLEAN=""
SCM_THEME_PROMPT_PREFIX="\[${EVA_MUTED_PURPLE}\]["
SCM_THEME_PROMPT_SUFFIX="\[${EVA_MUTED_PURPLE}\]]"
SCM_GIT_SHOW_MINIMAL_INFO=true

function _omb_theme_PROMPT_COMMAND() {
    local RC="$?"

    # Status markers
    local status_marker
    if [[ ${RC} == 0 ]]; then
        status_marker="\[${EVA_GREEN}\]●${EVA_RESET}"
    else
        status_marker="\[${_omb_prompt_bold_brown}\]●${EVA_RESET}"
    fi

    local python_info=""
    local python_venv; _omb_prompt_get_python_venv
    if [[ -n $python_venv ]]; then
        python_info="${EVA_GREEN}(py:${python_venv}) ${EVA_RESET}"
    fi

    local conda_info=""
    if [[ -n "${CONDA_DEFAULT_ENV}" ]]; then
        conda_info="${EVA_GREEN}(conda:${CONDA_DEFAULT_ENV}) ${EVA_RESET}"
    fi

    local docker_info=""
    if [[ -f /.dockerenv ]]; then
        docker_info="${EVA_GREEN}(docker) ${EVA_RESET}"
    fi

    local user_host="${EVA_PURPLE}\u@\h${EVA_RESET}"
    local current_dir="${EVA_GREEN}\w${EVA_RESET}"
    
    # Construction of the command line
    PS1="${status_marker} ${python_info}${conda_info}${docker_info}${user_host} ${current_dir} $(scm_prompt_char_info)\n${EVA_PURPLE}»${EVA_RESET} "
}

_omb_util_add_prompt_command _omb_theme_PROMPT_COMMAND
