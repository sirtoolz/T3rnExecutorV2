#!/usr/bin/env bash

# ============================================
# Made With Love By SIRTOOLZ
# Twitter: @sirtoolz
# Telegram Community: t.me/sirtoolzalpha
# ============================================

echo "============================================"
echo "🚀 Made With Love By SIRTOOLZ 🚀"
echo "📌 Twitter: @sirtoolz"
echo "📢 Join My Telegram Community: t.me/sirtoolzalpha"
echo "============================================"
sleep 2

# Update and install dependencies
echo "Updating and upgrading system..."
sudo apt update && sudo apt upgrade -y

echo "Installing required dependencies (curl, screen, jq, expect)..."
sudo apt install curl screen jq expect -y

# Start a new screen session (detached)
echo "Starting a new screen session..."
screen -S t3rn -d -m

# Download t3rn.sh script
echo "Downloading t3rn.sh script..."
wget https://raw.githubusercontent.com/voogarix/t3rn-/refs/heads/main/t3rn.sh -O t3rn.sh

echo "Making t3rn.sh executable..."
chmod +x t3rn.sh

echo "Starting interactive installation using expect..."

expect << 'EOF'
  # Disable timeout so it waits indefinitely for input
  set timeout -1

  # Uncomment the next line to see detailed debug output if needed:
  # exp_internal 1

  # Spawn t3rn.sh via script so it thinks it's in a real terminal.
  spawn script -q -
