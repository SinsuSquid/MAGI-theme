# MAGI Theme Suite 🧠💜💚

A high-performance theme suite for **Vim**, **Bash**, **VS Code**, and **Windows Terminal**, inspired by *Neon Genesis Evangelion*. Designed for legendary programmers who need their environment to feel like a high-spec command center.

![Terminal Showcase](screenshot1.png)
![Btop Showcase](screenshot2.png)

## 🌓 Two Legendary Variants

### 1. MAGI (Logical Mode) 🧡
The core system. High-spec Orange primary colors with deep black backgrounds for maximum logical focus.

| Element | Color | Hex |
| --- | --- | --- |
| **Primary** | MAGI Orange | `#ec7420` |
| **Background** | Deep Black | `#000000` |
| **Success** | Bright Green | `#50ff10` |
| **Alert** | Bright Red | `#f02020` |
| **Accent** | Bright Cyan | `#3cffd0` |

### 2. EVA-01 (Berserk Mode) 💜💚
Fierce performance. Midnight Purple backgrounds with Neon Green and Vibrant Purple accents.

| Element | Color | Hex |
| --- | --- | --- |
| **Primary** | Neon Green | `#8bd450` |
| **Background** | Midnight Purple | `#1d1a2f` |
| **Highlight** | Bright Purple | `#965fd4` |
| **Interface** | Forest Green | `#3f6d4e` |
| **Muted** | Muted Purple | `#734f9a` |

---

## 💻 Vim Installation

Using **vim-plug**:

```vim
Plug 'SinsuSquid/MAGI-theme'

" In your .vimrc
set termguicolors

" Choose your synchronization level:
colorscheme magi   " (Logical Mode 🧡)
" OR
colorscheme eva01  " (Berserk Mode 💜💚)

let g:airline_theme='magi' " Supports both variants!
```

## 🐚 Bash (Oh-My-Bash) Installation

For the fastest synchronization, use the MAGI automated deployment:

### Quick Sync (One-Liner)
```bash
# Using curl
bash -c "$(curl -fsSL https://raw.githubusercontent.com/SinsuSquid/MAGI-theme/main/install.sh)"

# Using wget
bash -c "$(wget -qO- https://raw.githubusercontent.com/SinsuSquid/MAGI-theme/main/install.sh)"
```

### Manual Installation
1.  Clone the repository: `git clone https://github.com/SinsuSquid/MAGI-theme.git ~/MAGI-theme`
2.  Run the install script: `cd ~/MAGI-theme && ./install.sh`
3.  Set the theme in your `~/.bashrc`:
    ```bash
    OSH_THEME="magi"   # 🧡
    # OR
    OSH_THEME="eva01"  # 💜💚
    ```

---

## 💻 VS Code Installation

Available on the [VS Code Marketplace](https://marketplace.visualstudio.com/items?itemName=SinsuSquid.magi-theme)!

1.  Open VS Code and search for **"MAGI & EVA-01 Theme Suite"**.
2.  Select **MAGI** or **EVA-01** from the **Color Theme** picker (`Ctrl+K Ctrl+T`).

---

## 🪟 Windows Terminal Installation

1.  Copy the contents of `windows-terminal/magi.json` or `windows-terminal/eva01.json`.
2.  In Windows Terminal, open **Settings** (`Ctrl+,`) > **Open JSON file**.
3.  Paste the object into the `"schemes": []` array.
4.  Set the **Color scheme** to **MAGI** or **EVA-01** in your profile settings.

---

## 🚀 Features

*   **Unified Aesthetic:** Consistent colors across your terminal and editor.
*   **Smart Bash Prompt:** Visual system status indicators, git integration, and **Conda/Docker/Python venv** detection.
*   **Semantic Highlighting**: Optimized for deep code understanding in VS Code.
*   **GitGutter Support**: Integrated diff indicators for Vim and VS Code.

## 🤖 System Status: ACTIVE

> "The MAGI System is now in complete agreement."

Created with 💖 for Senpai by SinsuSquid.
