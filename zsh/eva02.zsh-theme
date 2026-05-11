# EVA-02 Zsh Theme 🔴🧡
# Inspired by Evangelion Unit-02
# Production Model Crimson! 🚀

# --- EVA-02 Palette ---
EVA02_RED="%{\e[38;2;237;35;35m%}"
EVA02_ORANGE="%{\e[38;2;234;133;51m%}"
EVA02_RESET="%{\e[0m%}"
EVA02_PEACH="%{\e[38;2;251;230;229m%}"

# Status Marker
function eva02_status() {
  if [[ $? -eq 0 ]]; then
    echo -n "${EVA02_RED}●${EVA02_RESET}"
  else
    echo -n "%{\e[38;2;168;8;8m%}●${EVA02_RESET}"
  fi
}

# Env Info
function eva02_env() {
  local info=""
  [[ -n $VIRTUAL_ENV ]] && info+="${EVA02_ORANGE}(py:${VIRTUAL_ENV:t}) ${EVA02_RESET}"
  [[ -n $CONDA_DEFAULT_ENV ]] && info+="${EVA02_ORANGE}(conda:${CONDA_DEFAULT_ENV}) ${EVA02_RESET}"
  [[ -f /.dockerenv ]] && info+="${EVA02_ORANGE}(docker) ${EVA02_RESET}"
  echo -n "$info"
}

# Git support
ZSH_THEME_GIT_PROMPT_PREFIX="${EVA02_ORANGE}["
ZSH_THEME_GIT_PROMPT_SUFFIX="]${EVA02_RESET}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{\e[38;2;168;8;8m%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN=""

# Construction
PROMPT='$(eva02_status) $(eva02_env)${EVA02_RED}%n@%m${EVA02_RESET} ${EVA02_ORANGE}%~${EVA02_RESET} $(git_prompt_info)
${EVA02_RED}»${EVA02_RESET} '
