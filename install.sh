#!/usr/bin/env bash

##############
# * Script V01
#

version="01"

# * Deafault color is Blue
RST="\e[0m"
RED="\e[1;31m" # *This is bold 
GREEN="\e[1;32m"
BLUE="\e[34m"
DC=${BLUE}

#GREEN_THIN="\e[32m"

# * Used for testing
if [ -n "$HIPPO_BRANCH" ]; then
    BRANCH="$HIPPO_BRANCH"
fi


CACHE_ROOT="${HOME}/.uoa-cache-root"
TPREFIX="/data/data/com.termux/files"
#BIN_DIR="${TPREFIX}/usr/bin"
INSTALL_FOLDER="${TPREFIX}/usr/var/lib/proot-distro/installed-rootfs"
HIPPO_DIR="${INSTALL_FOLDER}/hippo"
SCRIPT_DIR="${TPREFIX}/usr/etc/proot-distro"
HIPPO_REPO_URL="https://github.com/RandomCoderOrg/ubuntu-on-android"
FSM_URL="https://github.com/RandomCoderOrg/fs-manager-hippo"

die    () { echo -e "${RED}Error ${*}${RST}";exit 1 ;:;}
warn   () { echo -e "${RED}Error ${*}${RST}";:;}
shout  () { echo -e "${DC}-----";echo -e "${*}";echo -e "-----${RST}";:; }
lshout () { echo -e "${DC}";echo -e "${*}";echo -e "${RST}";:; }


shout "\e[1;32 Hippo Installer v${version}"
sleep 2

#
# * die function exits program
# * shout just echo the messege out (fancy one line 😁)
#

function setup_and_clone()
{
    shout "Trying to update apt indexes...."
    apt update; apt upgrade -y

    if ! command -v git >> /dev/null; then
    shout "Installing git.."
        apt install git -y || {
            die "Git installation failed"
        }
        lshout "Done..."
    fi

    if ! command -v pulseaudio >> /dev/null; then
    shout "Installing pulseaudio..."
        apt install pulseaudio -y || {
            die "pulseaudio installation failed"
        }
        lshout "Done..."
    fi
    
    if ! command -v pv >> /dev/null; then
    shout "installing pv.."
        apt install pv -y
    fi

    if [ -d "${CACHE_ROOT}" ]; then
        shout "Removing old cache......."
        rm -rf "${CACHE_ROOT:?}/"*
        lshout "Done..."
    fi

    if [ -n "${BRANCH}" ]; then
        git clone -b "${BRANCH}" ${HIPPO_REPO_URL} "${CACHE_ROOT}/ubuntu-on-android" || die "failed to clone repo"
        git clone -b "${BRANCH}" ${FSM_URL} "${CACHE_ROOT}/fs-manager-hippo" || die "failed to clone repo"
    else
        git clone ${HIPPO_REPO_URL} "${CACHE_ROOT}/ubuntu-on-android" || die "failed to clone repo"
        git clone ${FSM_URL} "${CACHE_ROOT}/fs-manager-hippo" || die "failed to clone repo"
    fi
    lshout "Done..."

    install
}

function install()
{
    ####
    # * Step 1

    shout "setting up proot-distro hippo implant..."

    sleep 3
    
    if [ -f ${SCRIPT_DIR} ]; then
        mv ${SCRIPT_DIR} "${SCRIPT_DIR}1"
    fi

    if [ -f "${CACHE_ROOT}"/ubuntu-on-android/hippo.sh ]; then
        cp "${CACHE_ROOT}"/ubuntu-on-android/hippo.sh ${SCRIPT_DIR}
    fi

    ####
    # step 2

    if [ -f "${CACHE_ROOT}"/fs-manager-hippo/install.sh ]; then
        oldpwd="$(pwd)"
        cd "${CACHE_ROOT}"/fs-manager-hippo || die "failed to cd ..."
        bash install.sh || die "failed to install manager..."
        cd "${oldpwd}" || die "error"
    fi

    
     shout "setup complete...\nNow you can install and login with comand ${GREEN}hippo${DC} \nfor info use hippo --help"
    exit 1

}

setup_and_clone