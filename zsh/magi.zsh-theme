# MAGI System Zsh Theme ✨
# Inspired by the MAGI Supercomputer from Neon Genesis Evangelion.
# High-spec Orange Primary with multi-line HUD! 🚀

# --- MAGI Palette ---
MAGI_ORANGE="%{\e[38;2;236;116;32m%}"
MAGI_CYAN="%{\e[38;2;60;255;208m%}"
MAGI_BOLD_ORANGE="%{\e[1;38;2;236;116;32m%}"
MAGI_RESET="%{\e[0m%}"
MAGI_GREEN="%{\e[38;2;80;255;16m%}"
MAGI_RED="%{\e[38;2;168;8;8m%}"

# Status Marker
function magi_status() {
  if [[ $? -eq 0 ]]; then
    echo -n "${MAGI_GREEN}●${MAGI_RESET}"
  else
    echo -n "${MAGI_RED}●${MAGI_RESET}"
  fi
}

# Env Info
function magi_env() {
  local info=""
  [[ -n $VIRTUAL_ENV ]] && info+="${MAGI_CYAN}(py:${VIRTUAL_ENV:t}) ${MAGI_RESET}"
  [[ -n $CONDA_DEFAULT_ENV ]] && info+="${MAGI_CYAN}(conda:${CONDA_DEFAULT_ENV}) ${MAGI_RESET}"
  [[ -f /.dockerenv ]] && info+="${MAGI_CYAN}(docker) ${MAGI_RESET}"
  echo -n "$info"
}

# Git support (Oh-My-Zsh built-in)
ZSH_THEME_GIT_PROMPT_PREFIX="${MAGI_CYAN}["
ZSH_THEME_GIT_PROMPT_SUFFIX="]${MAGI_RESET}"
ZSH_THEME_GIT_PROMPT_DIRTY=" ${MAGI_RED}✗"
ZSH_THEME_GIT_PROMPT_CLEAN=""

# Construction
PROMPT='$(magi_status) $(magi_env)${MAGI_BOLD_ORANGE}%n@%m${MAGI_RESET} ${MAGI_CYAN}%~${MAGI_RESET} $(git_prompt_info)
${MAGI_ORANGE}»${MAGI_RESET} '
