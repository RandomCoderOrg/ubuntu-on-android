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
        else
            echo "Looks like \"hippo\" is already installed..."
        fi
        return 0
    else
        return 1
    fi
}

if ! command -v proot-distro; then
    apt install proot-distro -y
fi

if _implant_; then
    echo -e "Implant done......."
    echo -e "- Now you can install ubuntu by running \e[1;32mproot-distro install\e[0m"
else # this wont happen (mostly)
    echo ":( \e[32m error...\e[0m Please create a issue at \e[1;32mhttps://github.com/SaicharanKandukuri/ubuntu-on-android/issues\e[0m to resolve "
fi