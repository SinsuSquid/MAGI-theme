# EVA-01 Zsh Theme 💜💚
# Inspired by Evangelion Unit-01
# Midnight Purple Background with Neon Green Accents! 🚀

# --- EVA-01 Palette ---
EVA_PURPLE="%{\e[38;2;150;95;212m%}"
EVA_GREEN="%{\e[38;2;139;212;80m%}"
EVA_RESET="%{\e[0m%}"
EVA_RED="%{\e[38;2;168;8;8m%}"

# Status Marker
function eva01_status() {
  if [[ $? -eq 0 ]]; then
    echo -n "${EVA_GREEN}●${EVA_RESET}"
  else
    echo -n "${EVA_RED}●${EVA_RESET}"
  fi
}

# Env Info
function eva01_env() {
  local info=""
  [[ -n $VIRTUAL_ENV ]] && info+="${EVA_GREEN}(py:${VIRTUAL_ENV:t}) ${EVA_RESET}"
  [[ -n $CONDA_DEFAULT_ENV ]] && info+="${EVA_GREEN}(conda:${CONDA_DEFAULT_ENV}) ${EVA_RESET}"
  [[ -f /.dockerenv ]] && info+="${EVA_GREEN}(docker) ${EVA_RESET}"
  echo -n "$info"
}

# Git support
ZSH_THEME_GIT_PROMPT_PREFIX="${EVA_PURPLE}["
ZSH_THEME_GIT_PROMPT_SUFFIX="]${EVA_RESET}"
ZSH_THEME_GIT_PROMPT_DIRTY=" ${EVA_RED}✗"
ZSH_THEME_GIT_PROMPT_CLEAN=""

# Construction
PROMPT='$(eva01_status) $(eva01_env)${EVA_PURPLE}%n@%m${EVA_RESET} ${EVA_GREEN}%~${EVA_RESET} $(git_prompt_info)
${EVA_PURPLE}»${EVA_RESET} '
