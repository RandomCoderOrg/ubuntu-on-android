#!/usr/bin/env bash

####################################
# A Script to implant hippo inside 
# proot-distro(for now!)
#

DISTRO_PLUGINS_DIR="/data/data/com.termux/files/usr/etc/proot-distro"

function _implant_()
{
    if [ -r hippo-raw.sh ]; then
        if ! [ -r "${DISTRO_PLUGINS_DIR}"/hippo-raw.sh ]; then
            mv -v hippo.sh "${DISTRO_PLUGINS_DIR}"
        else
            echo "Looks like \"hippo-raw\" is already installed..."
        fi
        return 0
    else
        return 1
    fi
}

if _implant_; then
    echo -e "Implant done......."
    echo -e "- Now you can install ubuntu by running \e[1;32mproot-distro install\e[0m"
else
    echo ":( \e[32m error...\e[0m Please create a issue at \e[1;32mhttps://github.com/SaicharanKandukuri/ubuntu-on-android/issues\e[0m to resolve "
fi
