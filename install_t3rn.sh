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

# Update and install dependencies
echo "Updating and upgrading system..."
sudo apt update && sudo apt upgrade -y

echo "Installing required dependencies..."
sudo apt install curl screen jq -y

# Start a new screen session
echo "Starting a new screen session..."
screen -S t3rn -d -m

# Download and set up the t3rn script
echo "Downloading t3rn.sh script..."
wget https://raw.githubusercontent.com/voogarix/t3rn-/refs/heads/main/t3rn.sh -O t3rn.sh

echo "Making the script executable..."
chmod +x t3rn.sh

echo "Starting t3rn installation..."
./t3rn.sh

# Step-by-step user input
read -p "Select language (type 'en' for English and press Enter): " language
echo "$language" | ./t3rn.sh

read -p "Type '1' and press Enter to install the latest version: " install_choice
echo "$install_choice" | ./t3rn.sh

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

read -s -p "Enter your wallet private key and press Enter: " private_key
echo
echo "$private_key" | ./t3rn.sh

read -p "Enter your preferred max gas amount and press Enter: " max_gas
echo "$max_gas" | ./t3rn.sh

read -p "Do you want to add custom public RPC endpoints? (Type 'n' for default and press Enter): " rpc_custom
echo "$rpc_custom" | ./t3rn.sh

read -p "Enable networks (Type 'ARBT,BAST,OPST,UNIT' and press Enter): " networks
echo "$networks" | ./t3rn.sh

echo "✅ Setup completed successfully!"
echo "🚀 Made With Love By SIRTOOLZ"
echo "📢 Join My Telegram Community: t.me/sirtoolzalpha"
echo "============================================"
