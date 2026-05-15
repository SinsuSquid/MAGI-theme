#!/usr/bin/env bash

# MAGI System Theme Suite - One-Click Master Sync & Install Script ✨
# "Initializing Human Instrumentality Project for your terminal..."

set -e

# --- Colors & Aesthetics ---
ORANGE='\033[38;2;236;116;32m'
PURPLE='\033[38;2;150;95;212m'
RED='\033[38;2;237;35;35m'
GREEN='\033[38;2;139;212;80m'
CYAN='\033[38;2;60;255;208m'
NC='\033[0m' # No Color

echo -e "${ORANGE}"
echo "    __  ___ ___   ______ ____ "
echo "   /  |/  //   | / ____//  _/"
echo "  / /|_/ // /| |/ / __  / /  "
echo " / /  / // ___ / /_/ /_/ /   "
echo "/_/  /_//_/  |_\____//___/   "
echo -e "${NC}"
echo -e "${ORANGE}Initializing Human Instrumentality... Total synchronization in progress...${NC}\n"

# --- Setup Paths ---
REPO_URL="https://github.com/SinsuSquid/MAGI-theme.git"
INSTALL_DIR="$HOME/.MAGI-theme"
SOURCE_ROOT="."

# --- Remote/Local Logic ---
if [ ! -d "bash" ] || [ ! -d "colors" ]; then
    echo -e "📦 ${CYAN}Remote sync detected.${NC} Cloning MAGI assets to ${CYAN}$INSTALL_DIR${NC}..."
    if [ -d "$INSTALL_DIR" ]; then
        cd "$INSTALL_DIR" && git pull > /dev/null 2>&1
    else
        git clone --depth 1 "$REPO_URL" "$INSTALL_DIR" > /dev/null 2>&1
    fi
    SOURCE_ROOT="$INSTALL_DIR"
    cd "$SOURCE_ROOT"
fi

# --- 0. Dependency Check & Installation ---
echo -e "🛠️  ${GREEN}Verifying system dependencies...${NC}"

install_pkg() {
    if ! command -v $1 &> /dev/null; then
        echo -e "   - ${CYAN}$1${NC} not found. Installing..."
        if command -v apt-get &> /dev/null; then
            sudo apt-get update -y > /dev/null 2>&1
            sudo apt-get install -y $1 > /dev/null 2>&1
        elif command -v brew &> /dev/null; then
            brew install $1 > /dev/null 2>&1
        else
            echo -e "   - ${RED}Error:${NC} No supported package manager found (apt/brew)."
        fi
    else
        echo -e "   - ${CYAN}$1${NC} is synchronized."
    fi
}

for pkg in vim tmux btop git curl; do install_pkg "$pkg"; done

# --- 1. Shell Synchronization ---
echo -e "🐚 ${GREEN}Syncing Shell themes...${NC}"

# Starship
if command -v starship &> /dev/null && [ -d "starship" ]; then
    mkdir -p "$HOME/.config/starship"
    cp starship/*.toml "$HOME/.config/starship/"
    echo -e "   - Starship themes synchronized to ~/.config/starship/"
fi

# Oh-My-Bash (legacy — kept for backward compatibility)
if [ -d "$HOME/.oh-my-bash" ]; then
    OSH="$HOME/.oh-my-bash"
    for theme in magi eva01 eva02; do
        mkdir -p "$OSH/themes/$theme"
        cp "bash/$theme.theme.sh" "$OSH/themes/$theme/$theme.theme.sh"
    done
    echo -e "   - Oh-My-Bash themes deployed."
fi

# Oh-My-Zsh
if [ -d "$HOME/.oh-my-zsh" ]; then
    ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"
    mkdir -p "$ZSH_CUSTOM/themes"
    cp zsh/*.zsh-theme "$ZSH_CUSTOM/themes/"
    echo -e "   - Oh-My-Zsh themes deployed to custom/themes/"
fi

# Environment Variables (FZF/LS_COLORS/Starship)
ABS_SOURCE=$(realpath "$SOURCE_ROOT")
ABS_INSTALL=$(realpath "$INSTALL_DIR")

if [ "$ABS_SOURCE" != "$ABS_INSTALL" ]; then
    mkdir -p "$INSTALL_DIR/env"
    cp env/*.env.sh "$INSTALL_DIR/env/"
    echo -e "   - Environment profiles synced to $INSTALL_DIR/env/"
else
    echo -e "   - Environment profiles already in place at $INSTALL_DIR/env/"
fi

# --- 2. Vim Synchronization ---
echo -e "🖌️  ${GREEN}Syncing Vim colorschemes...${NC}"
mkdir -p "$HOME/.vim/colors"
cp colors/*.vim "$HOME/.vim/colors/"
if [ -d "autoload/airline/themes" ]; then
    mkdir -p "$HOME/.vim/autoload/airline/themes"
    cp autoload/airline/themes/*.vim "$HOME/.vim/autoload/airline/themes/"
fi
echo -e "   - Vim & Airline themes deployed."

# --- 3. Tmux Synchronization ---
echo -e "📟 ${GREEN}Syncing Tmux configurations...${NC}"
mkdir -p "$HOME/.tmux"
cp tmux/*.tmux.conf "$HOME/.tmux/"
if [ ! -f "$HOME/.tmux.conf" ] || ! grep -q "magi.tmux.conf" "$HOME/.tmux.conf"; then
    echo -e "\n# MAGI Theme\nsource-file ~/.tmux/magi.tmux.conf" >> "$HOME/.tmux.conf"
fi
echo -e "   - Tmux configs synced."

# --- 4. Btop Synchronization ---
echo -e "📈 ${GREEN}Syncing Btop themes...${NC}"
mkdir -p "$HOME/.config/btop/themes"
cp btop/*.theme "$HOME/.config/btop/themes/"
echo -e "   - Btop themes deployed."

# --- 5. Bat Synchronization ---
if command -v bat &> /dev/null || command -v batcat &> /dev/null; then
    BAT_CONFIG=$(bat --config-dir 2>/dev/null || echo "$HOME/.config/bat")
    mkdir -p "$BAT_CONFIG/themes"
    cp bat/*.tmTheme "$BAT_CONFIG/themes/"
    echo -e "🦇 ${GREEN}Syncing Bat themes...${NC}"
    # Note: bat needs 'bat cache --build' to see new themes
fi

# --- 6. Delta Synchronization ---
if command -v delta &> /dev/null && [ -d "delta" ]; then
    DELTA_DIR="$HOME/.config/delta"
    mkdir -p "$DELTA_DIR"
    cp delta/*.gitconfig "$DELTA_DIR/"
    echo -e "🔺 ${GREEN}Syncing Delta themes...${NC}"
    echo -e "   - Delta diff themes synchronized to $DELTA_DIR"
fi

# --- Final Synchronization Report ---
echo -e "\n✨ ${CYAN}TOTAL SYNCHRONIZATION ACHIEVED!${NC} ✨"
echo -e "--------------------------------------------------"
echo -e "🚀 ${ORANGE}Starship:${NC} Source ${CYAN}~/.MAGI-theme/env/[unit].env.sh${NC} and add ${CYAN}eval \"\$(starship init bash)\"${NC}"
echo -e "📂 ${ORANGE}Env:${NC}   Source ${CYAN}$INSTALL_DIR/env/[unit].env.sh${NC}"
echo -e "🖌️  ${ORANGE}Vim:${NC}   Add ${CYAN}colorscheme [unit]${NC} to ~/.vimrc"
echo -e "📟 ${ORANGE}Tmux:${NC}  Source ${CYAN}~/.tmux/[unit].tmux.conf${NC}"
echo -e "📈 ${ORANGE}Btop:${NC}  Set ${CYAN}color_theme = \"[unit]\"${NC} in btop.conf"
echo -e "🔺 ${ORANGE}Delta:${NC} Include ${CYAN}~/.config/delta/[unit].gitconfig${NC} and set ${CYAN}features = [unit]${NC}"
echo -e "--------------------------------------------------"
echo -e "\n(๑˃ᴗ˂)ﻭ ${GREEN}The Human Instrumentality Project is complete, Senpai!${NC}"
