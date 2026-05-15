# GEMINI.md

This file provides guidance to Gemini CLI when working with code in this repository.

## Project Overview

MAGI-theme is a **multi-tool terminal/editor theme suite** inspired by Neon Genesis Evangelion. It ships three color variants — **MAGI** (orange), **EVA-01** (purple/green), **EVA-02** (red/orange) — each implemented across multiple target environments.

## Architecture: Three Variants × Targets

Every theme variant has a counterpart file in each tool directory. When adding or modifying a theme element, **all three variants must be updated in parallel**:

| Dir | File Pattern | Tool |
|---|---|---|
| `colors/` | `<unit>.vim` | Vim colorscheme |
| `autoload/airline/themes/` | `<unit>.vim` | Vim Airline status bar |
| `starship/` | `<unit>.toml` | Starship prompt |
| `bash/` | `<unit>.theme.sh` | Oh-My-Bash prompt (legacy) |
| `zsh/` | `<unit>.zsh-theme` | Oh-My-Zsh prompt |
| `env/` | `<unit>.env.sh` | FZF + LS_COLORS env vars |
| `tmux/` | `<unit>.tmux.conf` | Tmux status bar |
| `btop/` | `<unit>.theme` | Btop monitor |
| `bat/` | `<unit>.tmTheme` | Bat syntax highlighting |
| `delta/` | `<unit>.gitconfig` | Delta diff pager |
| `vscode/themes/` | `<unit>-color-theme.json` | VS Code theme |
| `windows-terminal/` | `<unit>.json` | Windows Terminal scheme |

## Canonical Color Palettes

Always use these hex values from `ASSETS.md`:

### 🧡 MAGI
- **Primary Orange**: `#ec7420`
- **Background**: `#000000`
- **Accent Cyan**: `#3cffd0`
- **Interface Grey**: `#484848`

### 💜💚 EVA-01
- **Neon Green**: `#8bd450`
- **Midnight Purple**: `#1d1a2f`
- **Vibrant Purple**: `#965fd4`
- **Muted Purple**: `#734f9a`

### 🔴🧡 EVA-02
- **Unit-02 Red**: `#ed2323`
- **Background**: `#281d2d`
- **Accent Orange**: `#ea8533`
- **Light Orange**: `#f99d52`

## Development Workflows

### Installation & Deployment
- The primary script is `install.sh`.
- Local deployment: `./install.sh`.
- Remote deployment: `bash -c "$(curl -fsSL https://raw.githubusercontent.com/SinsuSquid/MAGI-theme/main/install.sh)"`.

### VS Code Extension
The `vscode/` directory is a self-contained package.
- To package: `cd vscode && vsce package`.
- Bump `version` in `vscode/package.json` before packaging.

## Key Conventions & Mandates

- **Synchronized Updates**: NEVER update one variant without updating the other two (`magi`, `eva01`, `eva02`) unless specifically instructed.
- **Color Consistency**: Stick strictly to the canonical hex codes.
- **Shell Prompts**: Define palette as local variables at the top of the theme script.
- **Tool Integrity**: Ensure `install.sh` remains compatible with both local and remote execution paths.
- **VS Code**: Follow VS Code theme JSON structure and maintain the extension's `package.json`.
