# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

MAGI-theme is a **multi-tool terminal/editor theme suite** inspired by Neon Genesis Evangelion. It ships three color variants — **MAGI** (orange), **EVA-01** (purple/green), **EVA-02** (red/orange) — each implemented across seven target environments.

## Installation & Deployment

The primary workflow is running `install.sh`, which auto-detects local vs. remote execution and copies theme files to the correct system paths:

```bash
# Local deployment (from repo root)
./install.sh

# Remote one-liner (what end users run)
bash -c "$(curl -fsSL https://raw.githubusercontent.com/SinsuSquid/MAGI-theme/main/install.sh)"
```

The script installs to:
- **Oh-My-Bash**: `~/.oh-my-bash/themes/<unit>/<unit>.theme.sh`
- **Oh-My-Zsh**: `~/.oh-my-zsh/custom/themes/`
- **Vim**: `~/.vim/colors/` and `~/.vim/autoload/airline/themes/`
- **Tmux**: `~/.tmux/`
- **Btop**: `~/.config/btop/themes/`
- **Bat**: `$(bat --config-dir)/themes/` (requires `bat cache --build` after deploy)
- **Claude Code**: `~/.claude/themes/` (then set theme via `/config` → Theme → `magi` / `eva01` / `eva02`)

## Architecture: Three Variants × Seven Targets

Every theme variant has a counterpart file in each tool directory. When adding or modifying a theme element, **all three variants must be updated in parallel**:

| Dir | File Pattern | Tool |
|---|---|---|
| `colors/` | `<unit>.vim` | Vim colorscheme |
| `autoload/airline/themes/` | `<unit>.vim` | Vim Airline status bar |
| `bash/` | `<unit>.theme.sh` | Oh-My-Bash prompt |
| `zsh/` | `<unit>.zsh-theme` | Oh-My-Zsh prompt |
| `env/` | `<unit>.env.sh` | FZF + LS_COLORS env vars |
| `tmux/` | `<unit>.tmux.conf` | Tmux status bar |
| `btop/` | `<unit>.theme` | Btop monitor |
| `bat/` | `<unit>.tmTheme` | Bat syntax highlighting |
| `delta/` | `<unit>.gitconfig` | Delta diff pager |
| `vscode/themes/` | `<unit>-color-theme.json` | VS Code theme |
| `windows-terminal/` | `<unit>.json` | Windows Terminal scheme |
| `claude/themes/` | `<unit>.json` | Claude Code UI theme |

## Canonical Color Palettes

When editing theme files, use only the canonical hex values from `ASSETS.md`:

**MAGI**: Primary `#ec7420`, BG `#000000`, Accent Cyan `#3cffd0`, Grey `#484848`

**EVA-01**: Primary Green `#8bd450`, BG `#1d1a2f`, Purple `#965fd4`, Muted Purple `#734f9a`

**EVA-02**: Primary Red `#ed2323`, BG `#281d2d`, Accent Orange `#ea8533`, Light Orange `#f99d52`

## Claude Code Themes

The `claude/themes/` subdirectory contains three JSON theme files that `install.sh` deploys to `~/.claude/themes/`. Claude Code auto-discovers any JSON files placed there and registers them as selectable themes. After running `install.sh`, select a theme via:

```
/config  →  Theme  →  magi / eva01 / eva02
```

Each theme JSON uses `"base": "dark"` plus named color tokens:
- `syntax-*`: code highlighting (`syntax-fg`, `syntax-comment`, `syntax-cyan`, `syntax-green`, `syntax-orange`, `syntax-pink`, `syntax-purple`, `syntax-red`, `syntax-yellow`)
- `modal-*`: dialog colors (`modal-bg`, `modal-text`, `modal-text-faded`)
- `log-*`: log level colors (`log-error`, `log-warn`, `log-note`, `log-colon`)
- `red`, `red-faded`: accent reds

## VS Code Extension

The `vscode/` subdirectory is a self-contained VS Code extension package. To build a new `.vsix`:

```bash
cd vscode
npm install -g @vscode/vsce   # one-time setup
vsce package                  # produces magi-theme-<version>.vsix
```

Bump `version` in `vscode/package.json` before packaging. Published to the VS Code Marketplace under publisher `SinsuSquid`.

## Key Conventions

- `install.sh` uses `realpath` to compare source vs. destination paths before any `cp` to avoid self-copy errors.
- The script detects remote invocation by checking for the absence of local `bash/` and `colors/` directories; if missing, it clones to `~/.MAGI-theme` first.
- Zsh themes rely on Oh-My-Zsh built-in `git_prompt_info`; Bash themes are standalone Oh-My-Bash theme scripts.
- Shell prompt files define their color palette as local variables at the top — keep palette definitions grouped there, not inline.
