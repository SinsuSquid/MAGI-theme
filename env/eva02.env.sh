# EVA-02 Environment Variables 🔴🧡
# High-spec FZF and LS_COLORS for Unit-02 Production Model

# --- EVA-02 FZF Theme ---
# fg: peach, bg: dark-purple, hl: orange
# fg+: black, bg+: red, hl+: orange
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
  --color=fg:#fbe6e5,bg:#281d2d,hl:#ea8533
  --color=fg+:#281d2d,bg+:#ed2323,hl+:#ea8533
  --color=info:#ea8533,prompt:#ed2323,pointer:#ea8533
  --color=marker:#ed2323,spinner:#3cffd0,header:#f99d52
'

# --- EVA-02 LS_COLORS ---
# di = directory (bold red)
# ln = symlink (bold orange)
# ex = executable (bold green)
export LS_COLORS="di=01;38;2;237;35;35:ln=01;38;2;234;133;51:ex=01;38;2;139;212;80:so=01;35:pi=40;33:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37"
