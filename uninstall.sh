#!/bin/bash

# BibleVerse Uninstaller
# Removes BibleVerse from system or user installation

set -e

# Colors for output
RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
CYAN='\033[1;36m'
RESET='\033[0m'

echo ""
echo -e "${CYAN}╔═══════════════════════════════════════════════════════════════════════╗${RESET}"
echo -e "${CYAN}║${YELLOW}            BibleVerse - TempleOS Tribute Uninstaller${CYAN}                ║${RESET}"
echo -e "${CYAN}╚═══════════════════════════════════════════════════════════════════════╝${RESET}"
echo ""

FOUND=0

# Check system-wide installation
if [ -L "/usr/local/bin/BibleVerse" ]; then
    echo -e "${YELLOW}Found system-wide installation:${RESET} /usr/local/bin/BibleVerse"
    FOUND=1
    SYSTEM_INSTALL=1
fi

# Check user installation
if [ -L "$HOME/.local/bin/BibleVerse" ]; then
    echo -e "${YELLOW}Found user installation:${RESET} ~/.local/bin/BibleVerse"
    FOUND=1
    USER_INSTALL=1
fi

if [ $FOUND -eq 0 ]; then
    echo -e "${RED}✗ BibleVerse is not installed${RESET}"
    exit 1
fi

echo ""
read -p "Do you want to uninstall BibleVerse? [y/N]: " confirm

if [[ ! $confirm =~ ^[Yy]$ ]]; then
    echo -e "${YELLOW}Uninstallation cancelled${RESET}"
    exit 0
fi

# Remove system-wide installation
if [ -n "$SYSTEM_INSTALL" ]; then
    echo ""
    echo -e "${CYAN}Removing system-wide installation...${RESET}"
    sudo rm -f /usr/local/bin/BibleVerse
    sudo rm -f /usr/local/bin/bibleverse
    sudo rm -f /usr/local/bin/godsays
    echo -e "${GREEN}✓ Removed /usr/local/bin/BibleVerse${RESET}"
    echo -e "${GREEN}✓ Removed aliases: bibleverse, godsays${RESET}"
fi

# Remove user installation
if [ -n "$USER_INSTALL" ]; then
    echo ""
    echo -e "${CYAN}Removing user installation...${RESET}"
    rm -f ~/.local/bin/BibleVerse
    rm -f ~/.local/bin/bibleverse
    rm -f ~/.local/bin/godsays
    echo -e "${GREEN}✓ Removed ~/.local/bin/BibleVerse${RESET}"
    echo -e "${GREEN}✓ Removed aliases: bibleverse, godsays${RESET}"
fi

echo ""
echo -e "${GREEN}╔═══════════════════════════════════════════════════════════════════════╗${RESET}"
echo -e "${GREEN}║${RESET}                 ✓ Uninstallation successful!                        ${GREEN}║${RESET}"
echo -e "${GREEN}╚═══════════════════════════════════════════════════════════════════════╝${RESET}"
echo ""
echo -e "${CYAN}BibleVerse has been removed from your system.${RESET}"
echo ""
echo -e "${YELLOW}Note: Source files remain in the repository directory${RESET}"
echo ""
