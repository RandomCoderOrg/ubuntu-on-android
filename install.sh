#!/usr/bin/env bash

####################################################
# UDROID installer Script V03 (mad installer)
# A script made by udroid team
# Copyright (c) 2021 @RandomCoderOrg <hello.1x1.sai@gmail.com>

version="3.1"
version_code_name="mi03"
installer_authors="saicharankandukuri"

# COLORS
_c_magneta="\e[95m"
_c_green="\e[32m"
_c_red="\e[31m"
_c_blue="\e[34m"
RST="\e[0m"

die()    { echo -e "${_c_red}[E] ${*}${RST}";if [ -n "$DISABLE_EXIT" ];then exit 1; fi;:;}
warn()   { echo -e "${_c_red}[W] ${*}${RST}";:;}
shout()  { echo -e "${_c_blue}[-] ${*}${RST}";:;}
lshout() { echo -e "${_c_blue}-> ${*}${RST}";:;}
msg()    { echo -e "${*} \e[0m" >&2;:;}

function logo() {
    tty_width=$(stty size | cut -d ' ' -f 2)

    if ((tty_width >= 50 )); then
        msg "████████████████████████████████████████████"
        echo
        msg "██╗░░░██╗██████╗░██████╗░░█████╗░██╗██████╗░"
        msg "██║░░░██║██╔══██╗██╔══██╗██╔══██╗██║██╔══██╗"
        msg "██║░░░██║██║░░██║██████╔╝██║░░██║██║██║░░██║"
        msg "██║░░░██║██║░░██║██╔══██╗██║░░██║██║██║░░██║"
        msg "╚██████╔╝██████╔╝██║░░██║╚█████╔╝██║██████╔╝"
        msg "░╚═════╝░╚═════╝░╚═╝░░╚═╝░╚════╝░╚═╝╚═════╝░"
        echo
        msg "████████████ (c)RandomCoderOrg ████████████"
    else
        msg "${_c_magneta}UDROID INSTALLER v$version\e[0m...."
        msg "\e[90m© RandomCoderOrg"
    fi
}

logo

# Check device os & CPU architecture
# just to make sure its not armv7l 
# (armv7l is not supported cause of 64bit cpu and 32bit os)
shout "Checking cpu architecture.."
if [ "$(uname -m)" = "armv7l" ]; then
    die "Sorry, armv7l is not supported.."
fi
msg "CPU architecture is OK."

# Check for required packages
shout "Checking for required packages.."
DEPENDS="git curl proot-distro"
for DEPEND in $DEPENDS; do
    if [ -z "$(command -v "$DEPEND")" ]; then
        msg "Installing $DEPEND.."
        pkg install -y "$DEPEND" || die "Failed to install $DEPEND"
    fi
done
msg "All required packages are installed."

# Install udroid tool
shout "Installing udroid tool.."
udroid_loc="/data/data/com.termux/files/usr/bin/udroid"
if command -v udroid >/dev/null 2>&1; then
    msg "udroid tool is already installed."
fi
curl -fsSL https://raw.githubusercontent.com/RandomCoderOrg/fs-manager-udroid/main/scripts/udroid/udroid.sh -o "$udroid_loc" || {
    die "Failed to download udroid tool."
}
chmod +x "$udroid_loc"

# Install udroid-xfce4 by default..
shout "Installing udroid-xfce4.."
msg "udroid -l xfce4"
udroid -i xfce4

# Login for first time
shout "Logining in to udroid"
msg "udroid -l xfce4"
udroid -l xfce4
