#!/bin/bash

# Check if the script is run as root
if [ "$(id -u)" -ne 0 ]; then
  echo "This script must be run as root. Please use sudo."
  exit 1
fi

# Install Nix
echo "Installing Nix..."
curl -L https://nixos.org/nix/install | sh

# Add the Nix binary directory to the PATH
echo "Adding Nix to PATH..."
echo "export PATH=\$HOME/.nix-profile/bin:\$PATH" >> ~/.bashrc
source ~/.bashrc

# Verify the installation
echo "Verifying Nix installation..."
if nix --version &> /dev/null; then
  echo "Nix has been successfully installed!"
else
  echo "Nix installation failed. Please check the logs for more information."
  exit 1
fi

exit 0
