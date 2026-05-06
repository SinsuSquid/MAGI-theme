#!/usr/bin/env bash

# MAGI System Theme Suite - Install Script ✨
# "Syncing MAGI & EVA-01 terminal interfaces to the core system..."

set -e

# Colors for the terminal (because we love aesthetics! 💖)
ORANGE='\033[38;2;236;116;32m'
PURPLE='\033[38;2;150;95;212m'
CYAN='\033[38;2;60;255;208m'
NC='\033[0m' # No Color

echo -e "${ORANGE}Initializing MAGI System synchronization...${NC}"

# Check for Oh-My-Bash
if [ -z "$OSH" ]; then
    if [ -d "$HOME/.oh-my-bash" ]; then
        OSH="$HOME/.oh-my-bash"
    else
        echo -e "💢 ${ORANGE}Error:${NC} Oh-My-Bash not found! Please install it first, Senpai!"
        exit 1
    fi
fi

REPO_URL="https://github.com/SinsuSquid/MAGI-theme.git"
TEMP_DIR=$(mktemp -d)
SOURCE_ROOT="."

# If we are running via curl/wget, we might not have the source files
if [ ! -f "bash/magi.theme.sh" ]; then
    echo -e "📦 ${CYAN}Remote execution detected.${NC} Fetching MAGI assets from GitHub..."
    git clone --depth 1 "$REPO_URL" "$TEMP_DIR" > /dev/null 2>&1
    SOURCE_ROOT="$TEMP_DIR"
fi

# Function to deploy a theme
deploy_theme() {
    local theme_name=$1
    local source_file=$2
    local target_dir="$OSH/themes/$theme_name"
    
    echo -e "📂 Deploying ${CYAN}$theme_name${NC} theme..."
    mkdir -p "$target_dir"
    cp "$SOURCE_ROOT/$source_file" "$target_dir/$theme_name.theme.sh"
}

# Deploy both themes
deploy_theme "magi" "bash/magi.theme.sh"
deploy_theme "eva01" "bash/eva01.theme.sh"

# Cleanup
rm -rf "$TEMP_DIR"

echo -e "\n✨ ${CYAN}MAGI Theme Suite synchronized successfully!${NC} ✨"
echo -e "To activate a theme, update your ${ORANGE}~/.bashrc${NC} to use one of these:"
echo -e "${ORANGE}OSH_THEME=\"magi\"${NC}   (Logical Mode 🧡)"
echo -e "${PURPLE}OSH_THEME=\"eva01\"${NC}  (Berserk Mode 💜💚)"
echo -e "\nThen run: ${ORANGE}source ~/.bashrc${NC}\n"
echo -e "(๑˃ᴗ˂)ﻭ Ready for duty, Senpai!"
