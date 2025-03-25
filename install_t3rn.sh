#!/bin/bash

# t3rn Node Setup Script
# This script will guide you through the installation and configuration of a t3rn node

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Display author information
echo -e "${GREEN}============================================${NC}"
echo -e "${YELLOW}🚀 Made With Love By SIRTOOLZ 🚀${NC}"
echo -e "${YELLOW}📌 Twitter: @sirtoolz${NC}"
echo -e "${YELLOW}📢 Join My Telegram Community: t.me/sirtoolzalpha${NC}"
echo -e "${GREEN}============================================${NC}"
echo ""

# Function to display error messages
error_exit() {
    echo -e "${RED}Error: $1${NC}" >&2
    exit 1
}

# Function to prompt for yes/no input
ask_yes_no() {
    local prompt="$1 (y/n) "
    while true; do
        read -p "$prompt" yn
        case $yn in
            [Yy]* ) return 0;;
            [Nn]* ) return 1;;
            * ) echo "Please answer yes or no.";;
        esac
    done
}

# Welcome message
echo -e "${GREEN}t3rn Node Setup Script${NC}"
echo "This script will help you install and configure a t3rn node."
echo ""

# Update and upgrade system
if ask_yes_no "Do you want to update and upgrade your system packages?"; then
    echo "Updating system packages..."
    sudo apt update && sudo apt upgrade -y || error_exit "Failed to update system packages."
fi

# Install required packages
echo "Installing required packages (curl, screen,
