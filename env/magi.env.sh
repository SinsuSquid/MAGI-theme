# MAGI Environment Variables 🧠✨
# High-spec FZF and LS_COLORS for the terminal

# --- MAGI FZF Theme ---
# fg: grey, bg: black, hl: cyan
# fg+: black, bg+: orange, hl+: red
# info: yellow, prompt: green, pointer: orange
# marker: orange, spinner: cyan, header: magenta
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
  --color=fg:#e8e8e8,bg:#000000,hl:#3cffd0
  --color=fg+:#000000,bg+:#ec7420,hl+:#f02020
  --color=info:#f4b000,prompt:#50ff10,pointer:#ec7420
  --color=marker:#ec7420,spinner:#3cffd0,header:#b040a0
'

# --- MAGI LS_COLORS ---
# rs=0:di=01;38;2;236;116;32:ln=01;38;2;60;255;208:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37:ex=01;38;2;80;255;16
# di = directory (bold orange)
# ln = symlink (bold cyan)
# ex = executable (bold green)
export LS_COLORS="di=01;38;2;236;116;32:ln=01;38;2;60;255;208:ex=01;38;2;80;255;16:so=01;35:pi=40;33:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37"

# --- MAGI Starship Prompt ---
export STARSHIP_CONFIG="$HOME/.config/starship/magi.toml"
