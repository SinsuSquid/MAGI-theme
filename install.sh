#!/usr/bin/env bash

# MAGI System Theme - Install Script ✨
# "Syncing MAGI terminal interface to the core system..."

set -e

# Colors for the terminal (because we love aesthetics! 💖)
ORANGE='\033[38;2;236;116;32m'
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

THEME_DIR="$OSH/themes/magi"
SOURCE_THEME="bash/magi.theme.sh"
REPO_URL="https://github.com/SinsuSquid/MAGI-theme.git"
TEMP_DIR=$(mktemp -d)

# If we are running via curl/wget, we might not have the source file
if [ ! -f "$SOURCE_THEME" ]; then
    echo -e "📦 ${CYAN}Remote execution detected.${NC} Fetching MAGI assets from GitHub..."
    git clone --depth 1 "$REPO_URL" "$TEMP_DIR" > /dev/null 2>&1
    SOURCE_PATH="$TEMP_DIR/$SOURCE_THEME"
else
    SOURCE_PATH="$SOURCE_THEME"
fi

# Create theme directory
echo -e "📂 Creating theme directory at ${CYAN}$THEME_DIR${NC}..."
mkdir -p "$THEME_DIR"

# Copy the theme file
echo -e "🚀 Deploying MAGI theme module..."
cp "$SOURCE_PATH" "$THEME_DIR/magi.theme.sh"

# Cleanup
rm -rf "$TEMP_DIR"

echo -e "\n✨ ${CYAN}MAGI System synchronized successfully!${NC} ✨"
echo -e "To activate, please update your ${ORANGE}~/.bashrc${NC} to use:"
echo -e "${CYAN}OSH_THEME=\"magi\"${NC}"
echo -e "\nThen run: ${ORANGE}source ~/.bashrc${NC}\n"
echo -e "(๑˃ᴗ˂)ﻭ Ready for duty, Senpai!"
