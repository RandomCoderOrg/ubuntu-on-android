#!/usr/bin/env bash

####################################
# A Script to implant hippo inside 
# proot-distro(for now!)
#
TERMUX_PREFIX="/data/data/com.termux/files"
DISTRO_PLUGINS_DIR="${TERMUX_PREFIX}/usr/etc/proot-distro"

function _implant_()
{
    if [ -f hippo.sh ]; then
        if ! [ -f "${DISTRO_PLUGINS_DIR}"/hippo.sh ]; then
            mv -v hippo.sh "${DISTRO_PLUGINS_DIR}"
            echo -e "Implant done......."
            echo -e "- Now you can install ubuntu by running \e[1;32mproot-distro install hippo\e[0m"
        else
            echo "Looks like \"hippo\" is already installed..."
            echo -e "you can install ubuntu by running \e[1;32mproot-distro install hippo\e[0m"
            echo -e "you can login to ubuntu by running \e[1;32mproot-distro login hippo\e[0m" 
        
        fi
        return 0
    else
        return 1
    fi
}
############################
#
# REQUIREMENTS

apt update; apt upgrade -y

if ! command -v proot-distro; then
    apt install proot-distro -y
fi
if ! command -v pulseaudio; then
    apt install pulseaudio -y
    pulseaudio --start --load="module-native-protocol-tcp auth-ip-acl=127.0.0.1 auth-anonymous=1" --exit-idle-time=-1
fi

########################
if ! _implant_; then # this wont happen (mostly)
    echo ":( \e[32m error...\e[0m Please create a issue at \e[1;32mhttps://github.com/SaicharanKandukuri/ubuntu-on-android/issues\e[0m to resolve "
fi
