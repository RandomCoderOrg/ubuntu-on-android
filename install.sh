#!/usr/bin/env bash

####################################
# A Script to implant hippo inside 
# proot-distro(for now!)
#

DISTRO_PLUGINS_DIR="/data/data/com.termux/files/usr/etc/proot-distro"

function _implant_()
{
    if [ -r hippo.sh ]; then
        mv -v hippo.sh "${DISTRO_PLUGINS_DIR}"
        return 0
    else
        return 1
    fi
}

if _implant_; then
    echo -e "Implant done......."
    proot-distro list | grep "hippo"
fi
