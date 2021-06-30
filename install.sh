#!/usr/bin/env bash

##############
# * Script V01
#


CACHE_ROOT="${HOME}/.uoa-cache-root"
TPREFIX="/data/data/com.termux/files"
BIN_DIR="${TPREFIX}/usr/bin"
INSTALL_FOLDER="${TPREFIX}/usr/var/lib/proot-distro/installed-rootfs"
HIPPO_DIR="${INSTALL_FOLDER}/hippo"
SCRIPT_DIR="${TPREFIX}/usr/etc/proot-distro/"
HIPPO_REPO_URL="https://github.com/RandomCoderOrg/ubuntu-on-android"
FSM_URL="https://github.com/RandomCoderOrg/fs-manager-hippo"

die   () { echo -e "\e[1;32m Error ${*}\e[0m";exit 1 ;:;}
shout () { echo -e "${*}\e[0m";:; }

#
# * die function exits program
# * shout just echo the messege out
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
    fi

    if ! command -v pulseaudio >> /dev/null; then
    shout "Installing pulseaudio..."
        apt install pulseaudio -y || {
            die "pulseaudio installation failed"
        }
    fi
    
    if ! command -v pv >> /dev/null; then
    shout "installing pv.."
        apt install pv -y
    fi

    git clone ${HIPPO_REPO_URL} "${CACHE_ROOT}/ubuntu-on-android" || die "failed to clone repo"
    git clone ${FSM_URL} "${CACHE_ROOT}/fs-manager-hippo" || die "failed to clone repo"

    install
}

function install()
{
    ####
    # * Step 1

    shout "setting up implant..."

    if [ -f "${CACHE_ROOT}"/ubuntu-on-android/hippo.sh ]; then
        cp "${CACHE_ROOT}"/ubuntu-on-android/hippo.sh ${SCRIPT_DIR}
    fi

    ####
    # step 2

    if [ -f "${CACHE_ROOT}"/fs-manager-hippo/install.sh ]; then
        oldpwd="$(pwd)"
        cd "${CACHE_ROOT}"/fs-manager-hippo || die "failed to cd ..."
        bash install.sh || die "failed to install manager..."
        cd "${oldpwd}"
    fi

    shout
    shout "setup complete..."
    shout "Now you can install and login with comand\e[1;32hippo"
    shout "for info use hippo --help"
    shout

    exit 1

}

setup_and_clone