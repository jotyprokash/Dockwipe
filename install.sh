#!/usr/bin/env bash
set -euo pipefail

echo "Installing dockwipe..."

if [ ! -f dockwipe ]; then
  echo "Error: 'dockwipe' executable not found in this directory."
  exit 1
fi

if ! command -v sudo >/dev/null 2>&1; then
  echo "Error: sudo is required for installation."
  exit 1
fi

echo "Copying to /usr/local/bin ..."
sudo install -m 755 dockwipe /usr/local/bin/dockwipe

if command -v dockwipe >/dev/null 2>&1; then
  echo "dockwipe installed successfully."
else
  echo "Installation failed."
  exit 1
fi

echo ""
echo "Try:"
echo "  dockwipe status"
echo "  dockwipe plan"
echo "  dockwipe clean --yes"
