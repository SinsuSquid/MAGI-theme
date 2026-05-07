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
            echo -e "   - ${RED}Error:${NC} No supported package manager found (apt/brew). Please install $1 manually, Senpai!"
        fi
    else
        echo -e "   - ${CYAN}$1${NC} is already synchronized."
    fi
}

install_pkg "vim"
install_pkg "tmux"
install_pkg "btop"
install_pkg "git"
install_pkg "curl"

# --- 1. Oh-My-Bash Installation & Sync ---
if [ ! -d "$HOME/.oh-my-bash" ]; then
    echo -e "🐚 ${GREEN}Oh-My-Bash not found. Initializing installation...${NC}"
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)" --unattended > /dev/null 2>&1
fi

OSH="$HOME/.oh-my-bash"
echo -e "🐚 ${GREEN}Syncing Oh-My-Bash themes...${NC}"
for theme in magi eva01 eva02; do
    mkdir -p "$OSH/themes/$theme"
    cp "bash/$theme.theme.sh" "$OSH/themes/$theme/$theme.theme.sh"
    echo -e "   - $theme deployed."
done

# --- 2. Vim Synchronization ---
echo -e "🖌️  ${GREEN}Syncing Vim colorschemes...${NC}"
mkdir -p "$HOME/.vim/colors"
cp colors/*.vim "$HOME/.vim/colors/"
echo -e "   - Colorschemes deployed to ~/.vim/colors/"

if [ -d "autoload/airline/themes" ]; then
    mkdir -p "$HOME/.vim/autoload/airline/themes"
    cp autoload/airline/themes/*.vim "$HOME/.vim/autoload/airline/themes/"
    echo -e "   - Airline themes deployed."
fi

# --- 3. Tmux Synchronization ---
echo -e "📟 ${GREEN}Syncing Tmux configurations...${NC}"
mkdir -p "$HOME/.tmux"
for theme in magi eva01 eva02; do
    cp "tmux/$theme.tmux.conf" "$HOME/.tmux/$theme.tmux.conf"
    echo -e "   - $theme config deployed."
done

if [ -f "$HOME/.tmux.conf" ]; then
    if ! grep -q "magi.tmux.conf" "$HOME/.tmux.conf" && ! grep -q "eva01.tmux.conf" "$HOME/.tmux.conf" && ! grep -q "eva02.tmux.conf" "$HOME/.tmux.conf"; then
        echo -e "\n# MAGI Theme\nsource-file ~/.tmux/magi.tmux.conf" >> "$HOME/.tmux.conf"
        echo -e "   - Default (magi) added to ~/.tmux.conf"
    fi
else
    echo "source-file ~/.tmux/magi.tmux.conf" > "$HOME/.tmux.conf"
    echo -e "   - Created ~/.tmux.conf with magi default."
fi

# --- 4. Btop Synchronization ---
echo -e "📈 ${GREEN}Syncing Btop themes...${NC}"
mkdir -p "$HOME/.config/btop/themes"
cp btop/*.theme "$HOME/.config/btop/themes/"
echo -e "   - All btop themes deployed."

# --- Final Synchronization Report ---
echo -e "\n✨ ${CYAN}ALL SYSTEMS SYNCHRONIZED AND INSTALLED!${NC} ✨"
echo -e "--------------------------------------------------"
echo -e "🐚 ${ORANGE}Bash:${NC} Set ${CYAN}OSH_THEME=\"magi\"${NC} (or eva01/eva02) in ~/.bashrc"
echo -e "🖌️  ${ORANGE}Vim:${NC}  Add ${CYAN}colorscheme magi${NC} (or eva01/eva02) to ~/.vimrc"
echo -e "📟 ${ORANGE}Tmux:${NC} source-file ~/.tmux/${CYAN}magi.tmux.conf${NC} (or eva01/eva02)"
echo -e "📈 ${ORANGE}Btop:${NC} Set ${CYAN}color_theme = \"magi\"${NC} (or eva01/eva02) in btop.conf"
echo -e "--------------------------------------------------"
echo -e "\n(๑˃ᴗ˂)ﻭ ${GREEN}Ready for duty, Senpai!${NC}"
