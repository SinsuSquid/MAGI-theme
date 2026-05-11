#! bash oh-my-bash.module
#
# EVA-01 Theme 💜💚 (Powerline Edition)
# Inspired by Evangelion Unit-01
# Midnight Purple Background with Neon Green HUD! 🚀

# --- EVA-01 Palette ---
EVA_PURPLE_RGB='150;95;212'
EVA_GREEN_RGB='139;212;80'
EVA_BG_PURPLE_RGB='29;26;47'
EVA_MUTED_PURPLE_RGB='115;79;154'
EVA_FOREST_GREEN_RGB='63;109;78'
EVA_RED_RGB='168;8;8'

# ANSI Escapes
function _omb_theme_EVA_BG() { echo -ne "\[\e[48;2;$1m\]"; }
function _omb_theme_EVA_FG() { echo -ne "\[\e[38;2;$1m\]"; }
EVA_RESET='\[\e[0m\]'

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
        PS1_HEAD+="$(_omb_theme_EVA_BG $EVA_GREEN_RGB)$(_omb_theme_EVA_FG $EVA_BG_PURPLE_RGB) ● "
        LAST_BG=$EVA_GREEN_RGB
    else
        PS1_HEAD+="$(_omb_theme_EVA_BG $EVA_RED_RGB)$(_omb_theme_EVA_FG '255;255;255') ● "
        LAST_BG=$EVA_RED_RGB
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
        # Transition: LAST_BG -> Muted Purple
        PS1_HEAD+="$(_omb_theme_EVA_BG $EVA_MUTED_PURPLE_RGB)$(_omb_theme_EVA_FG $LAST_BG)"
        PS1_HEAD+="$(_omb_theme_EVA_BG $EVA_MUTED_PURPLE_RGB)$(_omb_theme_EVA_FG $EVA_GREEN_RGB) ${env_info}"
        LAST_BG=$EVA_MUTED_PURPLE_RGB
    fi

    # 3. User@Host Segment
    # Transition: LAST_BG -> Purple
    PS1_HEAD+="$(_omb_theme_EVA_BG $EVA_PURPLE_RGB)$(_omb_theme_EVA_FG $LAST_BG)"
    PS1_HEAD+="$(_omb_theme_EVA_BG $EVA_PURPLE_RGB)$(_omb_theme_EVA_FG $EVA_BG_PURPLE_RGB) \u@\h "
    LAST_BG=$EVA_PURPLE_RGB

    # 4. Path Segment
    # Transition: LAST_BG (Purple) -> Green
    PS1_HEAD+="$(_omb_theme_EVA_BG $EVA_GREEN_RGB)$(_omb_theme_EVA_FG $LAST_BG)"
    PS1_HEAD+="$(_omb_theme_EVA_BG $EVA_GREEN_RGB)$(_omb_theme_EVA_FG $EVA_BG_PURPLE_RGB) \w "
    LAST_BG=$EVA_GREEN_RGB

    # 5. Git Segment (Wrapped if exists)
    local git_info=$(scm_prompt_char_info)
    if [[ -n $git_info ]]; then
        # Transition: LAST_BG (Green) -> Forest Green
        PS1_HEAD+="$(_omb_theme_EVA_BG $EVA_FOREST_GREEN_RGB)$(_omb_theme_EVA_FG $LAST_BG)"
        PS1_HEAD+="$(_omb_theme_EVA_BG $EVA_FOREST_GREEN_RGB)$(_omb_theme_EVA_FG $EVA_PURPLE_RGB) ${git_info} "
        LAST_BG=$EVA_FOREST_GREEN_RGB
    fi

    # End Head Segment
    PS1_HEAD+="$EVA_RESET$(_omb_theme_EVA_FG $LAST_BG)${EVA_RESET}"

    # Final construction
    PS1="${PS1_HEAD}\n$(_omb_theme_EVA_FG $EVA_GREEN_RGB)»${EVA_RESET} "
}

_omb_util_add_prompt_command _omb_theme_PROMPT_COMMAND
