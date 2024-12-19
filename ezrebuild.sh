#!/bin/bash

# Function to install curl and download the reinstall script
install_and_download() {
  local install_cmd="$1"
  # Install curl using the provided installation command
  $install_cmd curl && curl -O https://raw.githubusercontent.com/bin456789/reinstall/main/reinstall.sh
}

# Function to show menu and execute reinstall command
choose_and_reinstall() {
  echo "Choose OS to reinstall:"
  echo "1) Debian 9"
  echo "2) Debian 10"
  echo "3) Debian 11"
  echo "4) Debian 12"
  echo "5) Ubuntu 16.04"
  echo "6) Ubuntu 18.04"
  echo "7) Ubuntu 20.04"
  echo "8) Ubuntu 22.04"
  echo "9) Ubuntu 24.04"
  echo "10) Windows 7"
  echo "11) Windows 10"
  echo "12) Windows 11"
  echo "13) Anolis 7"
  echo "14) Anolis 8"
  echo "15) Rocky 8"
  echo "16) Rocky 9"
  echo "17) Redhat 8"
  echo "18) Redhat 9"
  echo "19) Almalinux 8"
  echo "20) Almalinux 9"
  echo "21) OpencloudOS 8"
  echo "22) OpencloudOS 9"
  echo "23) CentOS 9"
  echo "24) CentOS 10"
  echo "25) Oracle 7"
  echo "26) Oracle 8"
  echo "27) Oracle 9"
  echo "28) Fedora 40"
  echo "29) Fedora 41"
  echo "30) NixOS 24.11"
  echo "31) OpenEuler 20.03"
  echo "32) OpenEuler 22.03"
  echo "33) OpenEuler 24.03"
  echo "34) Alpine 3.18"
  echo "35) Alpine 3.19"
  echo "36) Alpine 3.20"
  echo "37) Alpine 3.21"
  echo "38) openSUSE 15.5"
  echo "39) openSUSE 15.6"
  echo "40) openSUSE Tumbleweed"
  echo "41) Kali"
  echo "42) Arch"
  echo "43) Gentoo"
  read -p "Enter choice [1-43]: " choice
  case $choice in
    1) bash reinstall.sh debian 9 --password daffaHelmi@12s ;;
    2) bash reinstall.sh debian 10 --password daffaHelmi@12s ;;
    3) bash reinstall.sh debian 11 --password daffaHelmi@12s ;;
    4) bash reinstall.sh debian 12 --password daffaHelmi@12s ;;
    5) bash reinstall.sh ubuntu 16.04 --password daffaHelmi@12s ;;
    6) bash reinstall.sh ubuntu 18.04 --password daffaHelmi@12s ;;
    7) bash reinstall.sh ubuntu 20.04 --password daffaHelmi@12s ;;
    8) bash reinstall.sh ubuntu 22.04 --password daffaHelmi@12s ;;
    9) bash reinstall.sh ubuntu 24.04 --password daffaHelmi@12s ;;
    10) bash reinstall.sh windows \
         --image-name 'Windows 7 Ultimate' \
         --lang en-us --password daffaHelmi@12s ;;
    11) bash reinstall.sh windows \
         --image-name 'Windows 10 Enterprise LTSC 2021' \
         --lang en-us --password daffaHelmi@12s ;;
    12) bash reinstall.sh windows \
         --image-name 'Windows 11 Enterprise LTSC 2024' \
         --lang en-us --password daffaHelmi@12s ;;
    13) bash reinstall.sh anolis 7 --password daffaHelmi@12s ;;
    14) bash reinstall.sh anolis 8 --password daffaHelmi@12s ;;
    15) bash reinstall.sh rocky 8 --password daffaHelmi@12s ;;
    16) bash reinstall.sh rocky 9 --password daffaHelmi@12s ;;
    17) bash reinstall.sh redhat 8 --password daffaHelmi@12s ;;
    18) bash reinstall.sh redhat 9 --password daffaHelmi@12s ;;
    19) bash reinstall.sh almalinux 8 --password daffaHelmi@12s ;;
    20) bash reinstall.sh almalinux 9 --password daffaHelmi@12s ;;
    21) bash reinstall.sh opencloudos 8 --password daffaHelmi@12s ;;
    22) bash reinstall.sh opencloudos 9 --password daffaHelmi@12s ;;
    23) bash reinstall.sh centos 9 --password daffaHelmi@12s ;;
    24) bash reinstall.sh centos 10 --password daffaHelmi@12s ;;
    25) bash reinstall.sh oracle 7 --password daffaHelmi@12s ;;
    26) bash reinstall.sh oracle 8 --password daffaHelmi@12s ;;
    27) bash reinstall.sh oracle 9 --password daffaHelmi@12s ;;
    28) bash reinstall.sh fedora 40 --password daffaHelmi@12s ;;
    29) bash reinstall.sh fedora 41 --password daffaHelmi@12s ;;
    30) bash reinstall.sh nixos 24.11 --password daffaHelmi@12s ;;
    31) bash reinstall.sh openeuler 20.03 --password daffaHelmi@12s ;;
    32) bash reinstall.sh openeuler 22.03 --password daffaHelmi@12s ;;
    33) bash reinstall.sh openeuler 24.03 --password daffaHelmi@12s ;;
    34) bash reinstall.sh alpine 3.18 --password daffaHelmi@12s ;;
    35) bash reinstall.sh alpine 3.19 --password daffaHelmi@12s ;;
    36) bash reinstall.sh alpine 3.20 --password daffaHelmi@12s ;;
    37) bash reinstall.sh alpine 3.21 --password daffaHelmi@12s ;;
    38) bash reinstall.sh opensuse 15.5 --password daffaHelmi@12s ;;
    39) bash reinstall.sh opensuse 15.6 --password daffaHelmi@12s ;;
    40) bash reinstall.sh opensuse tumbleweed --password daffaHelmi@12s ;;
    41) bash reinstall.sh kali --password daffaHelmi@12s ;;
    42) bash reinstall.sh arch --password daffaHelmi@12s ;;
    43) bash reinstall.sh gentoo --password daffaHelmi@12s ;;
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
  echo "However, you can use options 10, 11, or 12 for Windows installation if supported."
  # Bypass curl installation for unsupported Linux distributions
  choose_and_reinstall
fi
