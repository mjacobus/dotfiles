#!/usr/bin/env bash

set -e

echo "🔍 Checking if fwupd is installed..."
if ! command -v fwupdmgr &>/dev/null; then
	echo "📦 Installing fwupd..."
	sudo apt update
	sudo apt install -y fwupd
fi

echo "🔄 Refreshing firmware metadata..."
sudo fwupdmgr refresh --force

echo "🔎 Checking for firmware updates..."
sudo fwupdmgr get-updates

read -p "⚠️ Apply all available firmware updates now? [y/N]: " confirm
if [[ "$confirm" =~ ^[Yy]$ ]]; then
	echo "🚀 Applying updates..."
	sudo fwupdmgr update
else
	echo "❌ Update canceled."
fi

echo "Run fwupdmgr report-history to report your software versions to dell"
fwupdmgr report-history
