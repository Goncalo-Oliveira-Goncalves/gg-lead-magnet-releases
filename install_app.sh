#!/bin/bash
set -e

REPO="Goncalo-Oliveira-Goncalves/gg-lead-magnet-releases"
VERSION="v0.1.0"
VER="${VERSION#v}"

echo "=== Nuclear Rizz Installer ==="
echo ""

OS="$(uname -s)"
ARCH="$(uname -m)"

case "$OS" in
  Darwin)
    FILE="Nuclear.Rizz_${VER}_aarch64.dmg"
    ;;
  MINGW*|MSYS*|CYGWIN*)
    FILE="Nuclear.Rizz_${VER}_x64-setup.exe"
    ;;
  *)
    echo "Unsupported OS: $OS"
    echo "Only Windows and macOS are currently supported."
    exit 1
    ;;
esac

URL="https://github.com/$REPO/releases/latest/download/$FILE"

echo "Downloading $FILE from GitHub releases..."
curl -LO --fail "$URL"

echo ""
echo "Downloaded: $FILE"
echo ""

case "$OS" in
  Darwin)
    echo "To install, open the downloaded .dmg and drag Nuclear Rizz to Applications."
    echo ""
    echo "  open $FILE"
    ;;
  MINGW*|MSYS*|CYGWIN*)
    echo "To install, run the downloaded .exe:"
    echo ""
    echo "  start $FILE"
    ;;
esac
