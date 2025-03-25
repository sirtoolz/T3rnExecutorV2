#!/usr/bin/env bash

# ============================================
# Made With Love By SIRTOOLZ
# Twitter: @sirtoolz
# Telegram Community: t.me/sirtoolzalpha
# ============================================

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

# Now use expect to interact with the t3rn.sh script
echo "Starting interactive installation using expect..."
expect << 'EOF'
  # Disable timeout so it waits indefinitely for user input
  set timeout -1

  # Start the t3rn.sh script
  spawn ./t3rn.sh

  # Step 1: Language selection
  expect {
    -re {.*[Ss]elect language.*} {
      send_user "\nPlease type your language (e.g., 'en' for English): "
      expect_user -re "(.*)\n"
      set lang $expect_out(1,string)
      send "$lang\r"
    }
  }

  # Step 2: Install latest version
  expect {
    -re {.*install the latest version.*} {
      send_user "\nType '1' to install the latest version: "
      expect_user -re "(.*)\n"
      set version $expect_out(1,string)
      send "$version\r"
    }
  }

  # Step 3: Wait for extraction (this prompt may vary; adjust the regex if needed)
  expect {
    -re {.*extraction complete.*} {
      send_user "\nExtraction completed. Proceeding...\n"
    }
  }

  # Step 4: RPC option selection
  expect {
    -re {.*RPC option.*} {
      send_user "\nEnter 3 for Public RPCs or 2 for Alchemy API Key: "
      expect_user -re "(.*)\n"
      set rpc $expect_out(1,string)
      send "$rpc\r"
    }
  }

  # If Alchemy API key is chosen (assuming prompt text includes "Alchemy" when option 2 is selected)
  if { $rpc eq "2" } {
    expect {
      -re {.*Alchemy API key.*} {
        send_user "\nEnter your Alchemy API key: "
        expect_user -re "(.*)\n"
        set apikey $expect_out(1,string)
        send "$apikey\r"
      }
    }
  }

  # Step 5: Wallet private key
  expect {
    -re {.*wallet private key.*} {
      send_user "\nEnter your wallet private key (input hidden): "
      stty -echo
      expect_user -re "(.*)\n"
      stty echo
      set pkey $expect_out(1,string)
      send "$pkey\r"
    }
  }

  # Step 6: Max gas amount
  expect {
    -re {.*max gas amount.*} {
      send_user "\nEnter your preferred max gas amount: "
      expect_user -re "(.*)\n"
      set gas $expect_out(1,string)
      send "$gas\r"
    }
  }

  # Step 7: Custom public RPC endpoints prompt
  expect {
    -re {.*custom public RPC endpoints.*} {
      send_user "\nDo you want to add custom public RPC endpoints? (type 'n' for default): "
      expect_user -re "(.*)\n"
      set custom_rpc $expect_out(1,string)
      send "$custom_rpc\r"
    }
  }

  # Step 8: Enabling networks
  expect {
    -re {.*Enable networks.*} {
      send_user "\nType the networks to enable (e.g., ARBT,BAST,OPST,UNIT): "
      expect_user -re "(.*)\n"
      set networks $expect_out(1,string)
      send "$networks\r"
    }
  }

  # End of interaction
  expect eof
EOF

echo "✅ Setup completed successfully!"
echo "🚀 Made With Love By SIRTOOLZ"
echo "📢 Join My Telegram Community: t.me/sirtoolzalpha"
echo "============================================"
