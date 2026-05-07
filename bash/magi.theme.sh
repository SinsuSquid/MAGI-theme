#! bash oh-my-bash.module
#
# MAGI System Theme ✨
# Inspired by the MAGI Supercomputer from Neon Genesis Evangelion.
# High-spec Orange Primary with high visibility! 🚀

# --- MAGI Palette ---
# We wrap escape codes in \[ and \] so Bash doesn't get confused about prompt length!
MAGI_ORANGE='\[\e[38;2;236;116;32m\]'
MAGI_CYAN='\[\e[38;2;60;255;208m\]'
MAGI_BOLD_ORANGE='\[\e[1;38;2;236;116;32m\]'
MAGI_RESET='\[\e[0m\]'

SCM_NONE_CHAR=''
SCM_THEME_PROMPT_DIRTY=" \[${_omb_prompt_bold_brown}\]✗"
SCM_THEME_PROMPT_CLEAN=""
SCM_THEME_PROMPT_PREFIX="\[${_omb_prompt_bold_olive}\]["
SCM_THEME_PROMPT_SUFFIX="\[${_omb_prompt_bold_olive}\]]"
SCM_GIT_SHOW_MINIMAL_INFO=true

function _omb_theme_PROMPT_COMMAND() {
    local RC="$?"

    # MAGI system status markers (using OMB internal colors for better compatibility)
    local status_marker
    if [[ ${RC} == 0 ]]; then
        status_marker="\[${_omb_prompt_bold_green}\]●${MAGI_RESET}"
    else
        status_marker="\[${_omb_prompt_bold_brown}\]●${MAGI_RESET}"
    fi

    local python_info=""
    local python_venv; _omb_prompt_get_python_venv
    if [[ -n $python_venv ]]; then
        python_info="${MAGI_CYAN}(py:${python_venv}) ${MAGI_RESET}"
    fi

    local conda_info=""
    if [[ -n "${CONDA_DEFAULT_ENV}" ]]; then
        conda_info="${MAGI_CYAN}(conda:${CONDA_DEFAULT_ENV}) ${MAGI_RESET}"
    fi

    local docker_info=""
    if [[ -f /.dockerenv ]]; then
        docker_info="${MAGI_CYAN}(docker) ${MAGI_RESET}"
    fi

    local user_host="${MAGI_BOLD_ORANGE}\u@\h${MAGI_RESET}"
    local current_dir="${MAGI_CYAN}\w${MAGI_RESET}"
    
    # Construction of the MAGI command line
    # scm_prompt_char_info already handles its own escaping
    PS1="${status_marker} ${python_info}${conda_info}${docker_info}${user_host} ${current_dir} $(scm_prompt_char_info)\n${MAGI_ORANGE}»${MAGI_RESET} "
}

_omb_util_add_prompt_command _omb_theme_PROMPT_COMMAND
