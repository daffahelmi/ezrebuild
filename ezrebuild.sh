#!/bin/bash

# Function to install curl and download the reinstall script
install_and_download() {
  local install_cmd="$1"
  $install_cmd curl && curl -O https://raw.githubusercontent.com/bin456789/reinstall/main/reinstall.sh
}

# Function to show menu and execute reinstall command
choose_and_reinstall() {
  echo "Choose OS to reinstall:"
  echo "1) Debian 12"
  echo "2) Debian 11"
  echo "3) Ubuntu 22.04"
  echo "4) Ubuntu 20.04"
  echo "5) Windows 7 Ultimate"
  echo "6) Windows 10"
  echo "7) Windows 11"
  read -p "Enter choice [1-7]: " choice
  case $choice in
    1) bash reinstall.sh debian 12 --password daffaHelmi@12s ;;
    2) bash reinstall.sh debian 11 --password daffaHelmi@12s ;;
    3) bash reinstall.sh ubuntu 22.04 --password daffaHelmi@12s ;;
    4) bash reinstall.sh ubuntu 20.04 --password daffaHelmi@12s ;;
    5) bash reinstall.sh windows \
         --image-name 'Windows 7 Ultimate' \
         --lang en-us --password daffaHelmi@12s ;;
    6) bash reinstall.sh windows \
         --image-name 'Windows 10 Enterprise LTSC 2021' \
         --lang en-us --password daffaHelmi@12s ;;
    7) bash reinstall.sh windows \
         --image-name 'Windows 11 Enterprise LTSC 2024' \
         --lang en-us --password daffaHelmi@12s ;;
    *) echo "Invalid choice. Exiting."; exit 1 ;;
  esac
}

# Detect OS and execute appropriate commands
if [ -f /etc/debian_version ]; then
  install_and_download "apt install -y"
  choose_and_reinstall
elif [ -f /etc/centos-release ] || [ -f /etc/redhat-release ]; then
  install_and_download "yum install -y"
  choose_and_reinstall
elif [ -f /etc/fedora-release ]; then
  install_and_download "dnf install -y"
  choose_and_reinstall
elif [ -f /etc/arch-release ]; then
  install_and_download "pacman -S --noconfirm"
  choose_and_reinstall
elif [ -f /etc/alpine-release ]; then
  install_and_download "apk add --no-cache"
  choose_and_reinstall
else
  echo "Unsupported operating system. This script works only on Debian, Ubuntu, CentOS, Fedora, Arch, Alpine, or similar distributions."
  echo "However, you can use options 5, 6, or 7 for Windows installation if supported."
  choose_and_reinstall
fi
