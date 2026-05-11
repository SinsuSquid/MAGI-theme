#! bash oh-my-bash.module
#
# EVA-02 Theme 🔴🧡 (Powerline Edition)
# Inspired by Evangelion Unit-02
# Production Model Crimson HUD! 🚀

# --- EVA-02 Palette ---
EVA02_RED_RGB='237;35;35'
EVA02_ORANGE_RGB='234;133;51'
EVA02_BG_RGB='40;29;45'
EVA02_PEACH_RGB='251;230;229'
EVA02_LIGHT_ORANGE_RGB='249;157;82'

# ANSI Escapes
function _omb_theme_EVA02_BG() { echo -ne "\[\e[48;2;$1m\]"; }
function _omb_theme_EVA02_FG() { echo -ne "\[\e[38;2;$1m\]"; }
EVA02_RESET='\[\e[0m\]'

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
        PS1_HEAD+="$(_omb_theme_EVA02_BG $EVA02_RED_RGB)$(_omb_theme_EVA02_FG $EVA02_BG_RGB) ● "
        LAST_BG=$EVA02_RED_RGB
    else
        PS1_HEAD+="$(_omb_theme_EVA02_BG '168;8;8')$(_omb_theme_EVA02_FG '255;255;255') ● "
        LAST_BG='168;8;8'
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
        # Transition: LAST_BG -> Light Orange
        PS1_HEAD+="$(_omb_theme_EVA02_BG $EVA02_LIGHT_ORANGE_RGB)$(_omb_theme_EVA02_FG $LAST_BG)"
        PS1_HEAD+="$(_omb_theme_EVA02_BG $EVA02_LIGHT_ORANGE_RGB)$(_omb_theme_EVA02_FG $EVA02_RED_RGB) ${env_info}"
        LAST_BG=$EVA02_LIGHT_ORANGE_RGB
    fi

    # 3. User@Host Segment
    # Transition: LAST_BG -> Red
    PS1_HEAD+="$(_omb_theme_EVA02_BG $EVA02_RED_RGB)$(_omb_theme_EVA02_FG $LAST_BG)"
    PS1_HEAD+="$(_omb_theme_EVA02_BG $EVA02_RED_RGB)$(_omb_theme_EVA02_FG $EVA02_BG_RGB) \u@\h "
    LAST_BG=$EVA02_RED_RGB

    # 4. Path Segment
    # Transition: LAST_BG (Red) -> Orange
    PS1_HEAD+="$(_omb_theme_EVA02_BG $EVA02_ORANGE_RGB)$(_omb_theme_EVA02_FG $LAST_BG)"
    PS1_HEAD+="$(_omb_theme_EVA02_BG $EVA02_ORANGE_RGB)$(_omb_theme_EVA02_FG $EVA02_BG_RGB) \w "
    LAST_BG=$EVA02_ORANGE_RGB

    # 5. Git Segment (Wrapped if exists)
    local git_info=$(scm_prompt_char_info)
    if [[ -n $git_info ]]; then
        # Transition: LAST_BG (Orange) -> Dark Purple
        PS1_HEAD+="$(_omb_theme_EVA02_BG $EVA02_BG_RGB)$(_omb_theme_EVA02_FG $LAST_BG)"
        PS1_HEAD+="$(_omb_theme_EVA02_BG $EVA02_BG_RGB)$(_omb_theme_EVA02_FG $EVA02_RED_RGB) ${git_info} "
        LAST_BG=$EVA02_BG_RGB
    fi

    # End Head Segment
    PS1_HEAD+="$EVA02_RESET$(_omb_theme_EVA02_FG $LAST_BG)${EVA02_RESET}"

    # Final construction
    PS1="${PS1_HEAD}\n$(_omb_theme_EVA02_FG $EVA02_RED_RGB)»${EVA02_RESET} "
}

_omb_util_add_prompt_command _omb_theme_PROMPT_COMMAND
