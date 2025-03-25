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

  # Uncomment the next line to see detailed debug output:
  # exp_internal 1

  # Start the t3rn.sh script
  spawn ./t3rn.sh

  # Step 1: Select Language
  expect -re {.*[Ss]elect language.*}
  send "en\r"

  # Step 2: Install latest version
  expect -re {.*install the latest version.*}
  send "1\r"

  # Step 3: Wait for extraction (adjust regex if needed)
  expect -re {.*extraction complete.*}

  # Step 4: RPC option selection
  expect -re {.*RPC option.*}
  send_user "\nEnter RPC option (3 for Public RPCs or 2 for Alchemy API Key): "
  expect_user -re "(.*)\n"
  set rpc $expect_out(1,string)
  send "$rpc\r"

  # If Alchemy API key option was selected
  if { $rpc eq "2" } {
      expect -re {.*Alchemy API key.*}
      send_user "\nEnter your Alchemy API key: "
      expect_user -re "(.*)\n"
      set apikey $expect_out(1,string)
      send "$apikey\r"
  }

  # Step 5: Wallet private key (input hidden)
  expect -re {.*wallet private key.*}
  send_user "\nEnter your wallet private key: "
  stty -echo
  expect_user -re "(.*)\n"
  stty echo
  set pkey $expect_out(1,string)
  send "$pkey\r"

  # Step 6: Max gas amount
  expect -re {.*max gas amount.*}
  send_user "\nEnter your preferred max gas amount: "
  expect_user -re "(.*)\n"
  set gas $expect_out(1,string)
  send "$gas\r"

  # Step 7: Custom public RPC endpoints prompt
  expect -re {.*custom public RPC endpoints.*}
  send_user "\nDo you want to add custom public RPC endpoints? (type 'n' for default): "
  expect_user -re "(.*)\n"
  set custom $expect_out(1,string)
  send "$custom\r"

  # Step 8: Enabling networks
  expect -re {.*Enable networks.*}
  send_user "\nEnter the networks to enable (e.g., ARBT,BAST,OPST,UNIT): "
  expect_user -re "(.*)\n"
  set networks $expect_out(1,string)
  send "$networks\r"

  # Wait until the spawned process finishes
  expect eof
EOF

echo "✅ Setup completed successfully!"
echo "🚀 Made With Love By SIRTOOLZ"
echo "📢 Join My Telegram Community: t.me/sirtoolzalpha"
echo "============================================"
