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

# Update system and install dependencies
echo "Updating and upgrading system..."
sudo apt update && sudo apt upgrade -y

echo "Installing dependencies (curl, screen, jq, expect)..."
sudo apt install curl screen jq expect -y

# Start a new detached screen session
echo "Starting a new screen session..."
screen -S t3rn -d -m

# Download t3rn.sh script
echo "Downloading t3rn.sh script..."
wget https://raw.githubusercontent.com/voogarix/t3rn-/refs/heads/main/t3rn.sh -O t3rn.sh
chmod +x t3rn.sh

echo "Starting interactive installation using expect..."

expect << 'EOF'
  # Set no timeout to wait indefinitely
  set timeout -1
  
  # Uncomment the next line for detailed debug output:
  # exp_internal 1
  
  # Spawn t3rn.sh using unbuffer to force a pseudo-tty
  spawn unbuffer ./t3rn.sh
  
  # Step 1: Wait for language selection prompt
  expect {
    -re {.*[Ss]elect language.*} {
      send "en\r"
    }
    timeout { puts "\n[ERROR] Timed out waiting for language prompt"; exit 1 }
  }
  
  # Step 2: Wait for prompt to install the latest version
  expect {
    -re {.*install.*latest version.*} {
      send "1\r"
    }
    timeout { puts "\n[ERROR] Timed out waiting for installation prompt"; exit 1 }
  }
  
  # Step 3: Wait for extraction to complete (adjust regex as needed)
  expect {
    -re {.*extraction.*complete.*} {
      send_user "\nExtraction complete, proceeding...\n"
    }
    timeout { puts "\n[ERROR] Tim
