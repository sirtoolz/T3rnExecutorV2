#!/bin/bash

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

echo "Updating and upgrading system..."
sudo apt update && sudo apt upgrade -y

echo "Installing required dependencies..."
sudo apt install curl screen jq -y

echo "Starting a new screen session..."
screen -S t3rn -d -m

echo "Downloading t3rn.sh script..."
wget https://raw.githubusercontent.com/voogarix/t3rn-/refs/heads/main/t3rn.sh -O t3rn.sh

echo "Making the script executable and running it..."
chmod +x t3rn.sh && ./t3rn.sh

# Simulating user input
echo "Selecting English..."
echo "en" | ./t3rn.sh

echo "Installing the latest version..."
echo "1" | ./t3rn.sh

echo "Waiting for extraction to complete..."
sleep 10

echo "Choose RPC option:"
echo "Enter 3 for Public RPCs or 2 for Alchemy API Key"
read -p "Your choice: " rpc_choice
echo "$rpc_choice" | ./t3rn.sh

if [ "$rpc_choice" -eq 2 ]; then
    read -p "Enter your Alchemy API key: " api_key
    echo "$api_key" | ./t3rn.sh
fi

read -s -p "Enter your wallet private key: " private_key
echo
echo "$private_key" | ./t3rn.sh

read -p "Enter your preferred max gas amount: " max_gas
echo "$max_gas" | ./t3rn.sh

echo "Using default public RPCs..."
echo "n" | ./t3rn.sh

echo "Enabling networks..."
echo "ARBT,BAST,OPST,UNIT" | ./t3rn.sh

echo "✅ Setup completed successfully!"
echo "🚀 Made With Love By SIRTOOLZ"
echo "📢 Join My Telegram Community: t.me/sirtoolzalpha"
echo "============================================"
