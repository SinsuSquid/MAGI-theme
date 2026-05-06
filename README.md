# MAGI Theme Suite 🧠✨

A high-performance theme suite for **Vim** and **Bash**, inspired by the **MAGI Supercomputer** from *Neon Genesis Evangelion*. Designed for legendary programmers who need their environment to feel like a high-spec command center.

## 🧡 The Palette

| Element | Color | Hex |
| --- | --- | --- |
| **Primary** | Orange | `#ec7420` |
| **Background** | Deep Black | `#000000` |
| **Interface** | Grey | `#484848` |
| **Success** | Bright Green | `#50ff10` |
| **Warning** | Bright Yellow | `#f4b000` |
| **Error/Alert** | Bright Red | `#f02020` |
| **Info** | Bright Blue | `#40c8e8` |
| **Accent** | Bright Cyan | `#3cffd0` |

---

## 💻 Vim Installation

Using **vim-plug**:

```vim
Plug 'SinsuSquid/MAGI-theme'

" In your .vimrc
set termguicolors
colorscheme magi
let g:airline_theme='magi'
```

## 🐚 Bash (Oh-My-Bash) Installation

1.  Clone the repository:
    ```bash
    git clone https://github.com/SinsuSquid/MAGI-theme.git ~/MAGI-theme
    ```
2.  Copy or symlink the theme to your OMB custom folder:
    ```bash
    mkdir -p ~/.oh-my-bash/custom/themes/magi
    ln -s ~/MAGI-theme/bash/magi.theme.sh ~/.oh-my-bash/custom/themes/magi/magi.theme.sh
    ```
3.  Set the theme in your `~/.bashrc`:
    ```bash
    OSH_THEME="magi"
    ```
4.  Reload bash: `source ~/.bashrc`

## 📟 Tmux Installation

1.  Add the MAGI theme to your `~/.tmux.conf`:
    ```tmux
    source-file ~/MAGI-theme/tmux/magi.tmux.conf
    ```
2.  Reload tmux: `tmux source-file ~/.tmux.conf`

---

## 🚀 Features

*   **Unified Aesthetic:** Consistent colors across your terminal and editor.
*   **C++17 Ready:** Optimized syntax highlighting for modern C++ development.
*   **Airline Support:** Mode-specific color shifts (Green/Cyan/Red).
*   **Smart Bash Prompt:** Visual system status indicators and git integration.

## 🤖 System Status: ACTIVE

> "The MAGI System is now in complete agreement."

Created with 💖 for Senpai.
