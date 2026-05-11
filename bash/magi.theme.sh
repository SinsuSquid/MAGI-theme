#! bash oh-my-bash.module
#
# MAGI System Theme ✨ (Powerline Edition)
# Inspired by the MAGI Supercomputer from Neon Genesis Evangelion.
# High-spec Orange Primary with segmented HUD! 🚀

# --- MAGI Palette ---
MAGI_ORANGE_RGB='236;116;32'
MAGI_CYAN_RGB='60;255;208'
MAGI_GREY_RGB='72;72;72'
MAGI_BLACK_RGB='0;0;0'
MAGI_RED_RGB='168;8;8'

# ANSI Escapes
function _omb_theme_MAGI_BG() { echo -ne "\[\e[48;2;$1m\]"; }
function _omb_theme_MAGI_FG() { echo -ne "\[\e[38;2;$1m\]"; }
MAGI_RESET='\[\e[0m\]'

SCM_NONE_CHAR=''
SCM_THEME_PROMPT_DIRTY=" ${_omb_prompt_bold_brown}✗"
SCM_THEME_PROMPT_CLEAN=""
SCM_THEME_PROMPT_PREFIX="["
SCM_THEME_PROMPT_SUFFIX="]"
SCM_GIT_SHOW_MINIMAL_INFO=true

function _omb_theme_PROMPT_COMMAND() {
    local RC="$?"
    local PS1_HEAD=""

    # 1. Status Segment
    if [[ ${RC} == 0 ]]; then
        PS1_HEAD+="$(_omb_theme_MAGI_BG $MAGI_ORANGE_RGB)$(_omb_theme_MAGI_FG $MAGI_BLACK_RGB) ● "
        LAST_BG=$MAGI_ORANGE_RGB
    else
        PS1_HEAD+="$(_omb_theme_MAGI_BG $MAGI_RED_RGB)$(_omb_theme_MAGI_FG '255;255;255') ● "
        LAST_BG=$MAGI_RED_RGB
    fi

    # 2. Env Segment (Optional)
    local env_info=""
    local python_venv; _omb_prompt_get_python_venv
    [[ -n $python_venv ]] && env_info+="py:$python_venv "
    if [[ -n "${CONDA_DEFAULT_ENV}" ]]; then
        env_info+="conda:${CONDA_DEFAULT_ENV} "
    fi
    [[ -f /.dockerenv ]] && env_info+="docker "

    if [[ -n $env_info ]]; then
        # Transition: LAST_BG -> Grey
        PS1_HEAD+="$(_omb_theme_MAGI_BG $MAGI_GREY_RGB)$(_omb_theme_MAGI_FG $LAST_BG)"
        PS1_HEAD+="$(_omb_theme_MAGI_BG $MAGI_GREY_RGB)$(_omb_theme_MAGI_FG $MAGI_CYAN_RGB) ${env_info}"
        LAST_BG=$MAGI_GREY_RGB
    fi

    # 3. User@Host Segment
    # Transition: LAST_BG -> Orange
    if [[ "$LAST_BG" == "$MAGI_ORANGE_RGB" ]]; then
        PS1_HEAD+="$(_omb_theme_MAGI_FG $MAGI_BLACK_RGB) " # Soft sep if same color
    else
        PS1_HEAD+="$(_omb_theme_MAGI_BG $MAGI_ORANGE_RGB)$(_omb_theme_MAGI_FG $LAST_BG)"
    fi
    PS1_HEAD+="$(_omb_theme_MAGI_BG $MAGI_ORANGE_RGB)$(_omb_theme_MAGI_FG $MAGI_BLACK_RGB) \u@\h "
    LAST_BG=$MAGI_ORANGE_RGB

    # 4. Path Segment
    # Transition: LAST_BG (Orange) -> Cyan
    PS1_HEAD+="$(_omb_theme_MAGI_BG $MAGI_CYAN_RGB)$(_omb_theme_MAGI_FG $LAST_BG)"
    PS1_HEAD+="$(_omb_theme_MAGI_BG $MAGI_CYAN_RGB)$(_omb_theme_MAGI_FG $MAGI_BLACK_RGB) \w "
    LAST_BG=$MAGI_CYAN_RGB

    # 5. Git Segment (Wrapped if exists)
    local git_info=$(scm_prompt_char_info)
    if [[ -n $git_info ]]; then
        # Transition: LAST_BG (Cyan) -> Grey
        PS1_HEAD+="$(_omb_theme_MAGI_BG $MAGI_GREY_RGB)$(_omb_theme_MAGI_FG $LAST_BG)"
        PS1_HEAD+="$(_omb_theme_MAGI_BG $MAGI_GREY_RGB)$(_omb_theme_MAGI_FG $MAGI_ORANGE_RGB) ${git_info} "
        LAST_BG=$MAGI_GREY_RGB
    fi

    # End Head Segment
    PS1_HEAD+="$MAGI_RESET$(_omb_theme_MAGI_FG $LAST_BG)${MAGI_RESET}"

    # Final construction
    PS1="${PS1_HEAD}\n$(_omb_theme_MAGI_FG $MAGI_ORANGE_RGB)»${MAGI_RESET} "
}

_omb_util_add_prompt_command _omb_theme_PROMPT_COMMAND
