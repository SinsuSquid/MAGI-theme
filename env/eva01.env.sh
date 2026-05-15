# EVA-01 Environment Variables 💜💚
# High-spec FZF and LS_COLORS for Unit-01

# --- EVA-01 FZF Theme ---
# fg: grey, bg: midnight-purple, hl: neon-green
# fg+: black, bg+: neon-green, hl+: bright-purple
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
  --color=fg:#e8e8e8,bg:#1d1a2f,hl:#8bd450
  --color=fg+:#1d1a2f,bg+:#8bd450,hl+:#965fd4
  --color=info:#965fd4,prompt:#8bd450,pointer:#8bd450
  --color=marker:#8bd450,spinner:#3cffd0,header:#734f9a
'

# --- EVA-01 LS_COLORS ---
# di = directory (bold green)
# ln = symlink (bold purple)
# ex = executable (bold cyan)
export LS_COLORS="di=01;38;2;139;212;80:ln=01;38;2;150;95;212:ex=01;38;2;60;255;208:so=01;35:pi=40;33:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37"

# --- EVA-01 Starship Prompt ---
export STARSHIP_CONFIG="$HOME/.config/starship/eva01.toml"
