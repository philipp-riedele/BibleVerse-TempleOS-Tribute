#!/bin/bash

# BibleVerse Installer
# Professional installation script for TempleOS Bible Verse Generator

set -e

# Colors for output
RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
CYAN='\033[1;36m'
RESET='\033[0m'

# Get script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo ""
echo -e "${CYAN}╔═══════════════════════════════════════════════════════════════════════╗${RESET}"
echo -e "${CYAN}║${YELLOW}              BibleVerse - TempleOS Tribute Installer${CYAN}                 ║${RESET}"
echo -e "${CYAN}║${RESET}          In Memory of Terry A. Davis (1969-2018)                    ${CYAN}║${RESET}"
echo -e "${CYAN}╚═══════════════════════════════════════════════════════════════════════╝${RESET}"
echo ""

# Check if required files exist
if [ ! -f "$SCRIPT_DIR/BibleVerse" ]; then
    echo -e "${RED}✗ Error: BibleVerse script not found in $SCRIPT_DIR${RESET}"
    exit 1
fi

if [ ! -f "$SCRIPT_DIR/verses.txt" ]; then
    echo -e "${RED}✗ Error: verses.txt not found in $SCRIPT_DIR${RESET}"
    exit 1
fi

# Installation options
echo -e "${YELLOW}Choose installation method:${RESET}"
echo ""
echo "  1) System-wide installation (requires sudo)"
echo "     → /usr/local/bin/BibleVerse"
echo ""
echo "  2) User installation (no sudo required)"
echo "     → ~/.local/bin/BibleVerse"
echo ""
read -p "Enter choice [1-2]: " choice

case $choice in
    1)
        # System-wide installation
        echo ""
        echo -e "${CYAN}Installing system-wide...${RESET}"

        # Check if already installed
        if [ -L "/usr/local/bin/BibleVerse" ]; then
            echo -e "${YELLOW}! BibleVerse is already installed (symlink exists)${RESET}"
            read -p "Overwrite existing installation? [y/N]: " confirm
            if [[ ! $confirm =~ ^[Yy]$ ]]; then
                echo -e "${RED}✗ Installation cancelled${RESET}"
                exit 0
            fi
            sudo rm -f /usr/local/bin/BibleVerse
        fi

        # Make script executable
        chmod +x "$SCRIPT_DIR/BibleVerse"

        # Create symlink
        sudo ln -s "$SCRIPT_DIR/BibleVerse" /usr/local/bin/BibleVerse

        # Create aliases
        sudo ln -sf /usr/local/bin/BibleVerse /usr/local/bin/bibleverse
        sudo ln -sf /usr/local/bin/BibleVerse /usr/local/bin/godsays

        INSTALL_PATH="/usr/local/bin/BibleVerse"
        echo -e "${GREEN}✓ Aliases created: bibleverse, godsays${RESET}"
        ;;

    2)
        # User installation
        echo ""
        echo -e "${CYAN}Installing for current user...${RESET}"

        # Create ~/.local/bin if it doesn't exist
        mkdir -p ~/.local/bin

        # Check if already installed
        if [ -L "$HOME/.local/bin/BibleVerse" ]; then
            echo -e "${YELLOW}! BibleVerse is already installed (symlink exists)${RESET}"
            read -p "Overwrite existing installation? [y/N]: " confirm
            if [[ ! $confirm =~ ^[Yy]$ ]]; then
                echo -e "${RED}✗ Installation cancelled${RESET}"
                exit 0
            fi
            rm -f ~/.local/bin/BibleVerse
        fi

        # Make script executable
        chmod +x "$SCRIPT_DIR/BibleVerse"

        # Create symlink
        ln -s "$SCRIPT_DIR/BibleVerse" ~/.local/bin/BibleVerse

        # Create aliases
        ln -sf ~/.local/bin/BibleVerse ~/.local/bin/bibleverse
        ln -sf ~/.local/bin/BibleVerse ~/.local/bin/godsays

        INSTALL_PATH="$HOME/.local/bin/BibleVerse"
        echo -e "${GREEN}✓ Aliases created: bibleverse, godsays${RESET}"

        # Check if ~/.local/bin is in PATH
        if [[ ":$PATH:" != *":$HOME/.local/bin:"* ]]; then
            echo ""
            echo -e "${YELLOW}⚠ Warning: ~/.local/bin is not in your PATH${RESET}"
            echo ""
            echo "Add this to your ~/.bashrc or ~/.zshrc:"
            echo -e "${GREEN}export PATH=\"\$HOME/.local/bin:\$PATH\"${RESET}"
            echo ""
        fi
        ;;

    *)
        echo -e "${RED}✗ Invalid choice${RESET}"
        exit 1
        ;;
esac

# Verify installation
if [ -L "$INSTALL_PATH" ]; then
    echo ""
    echo -e "${GREEN}╔═══════════════════════════════════════════════════════════════════════╗${RESET}"
    echo -e "${GREEN}║${RESET}                   ✓ Installation successful!                        ${GREEN}║${RESET}"
    echo -e "${GREEN}╚═══════════════════════════════════════════════════════════════════════╝${RESET}"
    echo ""
    echo -e "${CYAN}BibleVerse has been installed to:${RESET}"
    echo -e "  ${YELLOW}$INSTALL_PATH${RESET}"
    echo ""
    echo -e "${CYAN}Usage:${RESET}"
    echo "  BibleVerse"
    echo ""
    echo -e "${YELLOW}Test it now:${RESET}"
    echo ""

    # Run BibleVerse
    "$INSTALL_PATH"

else
    echo ""
    echo -e "${RED}✗ Installation failed!${RESET}"
    exit 1
fi
