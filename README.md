# MAGI Theme Suite 🧠✨

A high-performance theme suite for **Vim** and **Bash**, inspired by the **MAGI Supercomputer** from *Neon Genesis Evangelion*. Designed for legendary programmers who need their environment to feel like a high-spec command center.

![Terminal Showcase](screenshot1.png)
![Btop Showcase](screenshot2.png)

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

For the fastest synchronization, use the MAGI automated deployment:

### Quick Sync (One-Liner)
```bash
# Using curl
bash -c "$(curl -fsSL https://raw.githubusercontent.com/SinsuSquid/MAGI-theme/main/install.sh)"

# Using wget
bash -c "$(wget -qO- https://raw.githubusercontent.com/SinsuSquid/MAGI-theme/main/install.sh)"
```

### Manual Installation
1.  Clone the repository:
    ```bash
    git clone https://github.com/SinsuSquid/MAGI-theme.git ~/MAGI-theme
    ```
2.  Run the install script:
    ```bash
    cd ~/MAGI-theme && ./install.sh
    ```

3.  Set the theme in your `~/.bashrc`:
    ```bash
    OSH_THEME="magi"
    ```

4.  **Optional:** Add MAGI Environment Variables (LS_COLORS and FZF) to your `~/.bashrc`:
    ```bash
    [ -f ~/MAGI-theme/env/magi.env.sh ] && source ~/MAGI-theme/env/magi.env.sh
    ```

5.  Reload bash: `source ~/.bashrc`

## 📟 Tmux Installation

1.  Add the MAGI theme to your `~/.tmux.conf`:
    ```tmux
    source-file ~/MAGI-theme/tmux/magi.tmux.conf
    ```
2.  Reload tmux: `tmux source-file ~/.tmux.conf`

## 📈 Btop Installation

1.  Create the themes directory and symlink the theme:
    ```bash
    mkdir -p ~/.config/btop/themes
    ln -s ~/MAGI-theme/btop/magi.theme ~/.config/btop/themes/magi.theme
    ```
2.  Update your `~/.config/btop/btop.conf`:
    ```ini
    color_theme = "magi"
    ```

## 💻 VS Code Installation

![VS Code Showcase](screenshot_vscode.png)

1.  Open the repository folder in VS Code.
2.  Press `F5` to launch a new window with the theme enabled, or:
3.  Copy the `vscode` folder to your extensions directory:
    *   **Linux/macOS:** `cp -r ~/MAGI-theme/vscode ~/.vscode/extensions/magi-theme`
    *   **Windows (Command Prompt):**
        ```cmd
        xcopy /E /I "C:\path\to\MAGI-theme\vscode" "%USERPROFILE%\.vscode\extensions\magi-theme"
        ```
    *   **Windows (PowerShell):**
        ```powershell
        Copy-Item -Recurse -Path ".\vscode" -Destination "$HOME\.vscode\extensions\magi-theme"
        ```
4.  Open VS Code and select **MAGI** from the **Color Theme** picker (`Ctrl+K Ctrl+T`).

---

## 🚀 Features

*   **Unified Aesthetic:** Consistent colors across your terminal and editor.
*   **C++17 Ready:** Optimized syntax highlighting for modern C++ development.
*   **Airline Support:** Mode-specific color shifts (Green/Cyan/Red).
*   **Smart Bash Prompt:** Visual system status indicators, git integration, and **Conda/Docker/Python venv** detection.

## 🤖 System Status: ACTIVE

> "The MAGI System is now in complete agreement."

Created with 💖 for Senpai.
