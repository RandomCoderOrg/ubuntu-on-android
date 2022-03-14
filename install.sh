#!/usr/bin/env bash

####################################################
# UDROID installer Script V01 (mad installer)
# A script made by @zman-1x1 saicharankandukuri
# Copyright (c) 2021 Saicharan Kandukuri <hello.1x1.sai@gmail.com>


version="03"
version_code_name="mi02"
installer_authors="saicharankandukuri"

# * Deafault color is Blue
_c_magneta="\e[95m"
_c_green="\e[32m"
_c_red="\e[31m"
_c_blue="\e[34m"
RST="\e[0m"

# CACHE_ROOT is the place where are download caches are stored
CACHE_ROOT="${HOME}/.udroid-cache-root"

# TPREFIX where root of termux starts
TPREFIX="/data/data/com.termux/files"

# BIN_DIR where binary files are stored in termux
# * (like /bin in traditional linux)
BIN_DIR="${TPREFIX}/usr/bin"

# INSTALL_FOLDER variable points to folder location where the file systems are installed in proot-distro
# * used when checking for udroid
INSTALL_FOLDER="${TPREFIX}/usr/var/lib/proot-distro/installed-rootfs"

# UDROID_DIR variable points to folder where udroid root filesystem is in
UDROID_DIR="${INSTALL_FOLDER}/udroid"

# SCRIPT_DIR variable points to folder where plugins for proot-distro is stored
# * this is where udroid.sh plugin goes

SCRIPT_DIR="${TPREFIX}/usr/etc/proot-distro/"

# UDROID_REPO_URL & FSM_URL are github repo urls later used to clone the code
UDROID_REPO_URL="https://github.com/RandomCoderOrg/ubuntu-on-android"
FSM_URL="https://github.com/RandomCoderOrg/fs-manager-udroid"

# DEPENDS programs required to run Hippo
# * proot-distro - A proot manager tool
#                  (which starts udroid)
# * git          - the stupid content tracker
#                  (used to copy code from github repo)
# * pulseaudo    - PulseAudio is a networked low-latency sound server for Linux
#                  (which is used to get audio from udroid using moudle-tcp*)
# * Others dependencies like tar comes pre-loaded in termux so no need to mention
DEPENDS="proot-distro pulseaudio git"


# * Usefull functions
# die()     exit with code 1 with printing given string
# warn()    like die() without exit status (used when exit is not necessary)
# shout()   pring messege in a good way with some lines
# lshout()  print messege in a standard way

die()    { echo -e "${_c_red}[E] ${*}${RST}";exit 1;:;}
warn()   { echo -e "${_c_red}[W] ${*}${RST}";:;}
shout()  { echo -e "${_c_blue}[-] ${*}${RST}";:;}
lshout() { echo -e "${_c_blue}-> ${*}${RST}";:;}
msg()    { echo -e "${*} \e[0m" >&2;:;}

shout "\e[1;32m Udroid Installer v${version} ${version_code_name} \n by ${installer_authors}"
sleep 2

case $(uname -m) in
    aarch64|armv7l) : ;;
    armv8l) warn "armv8l may cause issues";;
    *)
    die ": sorry Only aarch64 armv7l os architecture is supported for now"
    ;;
esac

######################################
# * function setup_and_clone
#
# 1. install required programs
# 2. remove previous cache if found
# 3. clone code from links in UDROID_REPO_URL & FSM_URL
# 4. call install function
# if anything goes wrong or any program in code fails kill the installation by calling die function

function _NOTICE_()
{
    if [ ! -f ~/.udroid_notice.lock ]; then
        touch ~/.udroid_notice.lock
        shout "The Code name for this ubuntu is changed from \"hippo\" to \"udroid\""
        sleep 5
    fi
}

function setup_and_clone()
{
    shout "Trying to update apt indexes...."
    apt update; apt upgrade -y

    for DEP in $DEPENDS
    do
        if ! command -v "$DEP" >> /dev/null; then
            shout "Installing ${DEP}.."
            apt install "$DEP" -y || {
                die "$DEP installation failed"
            }
        fi
    done


    if [ -d "${CACHE_ROOT}" ]; then
        shout "Removing old cache......."
        rm -rf "${CACHE_ROOT:?}/"*
        lshout "Done..."
    fi

    shout "Cloning code from Github........."
    if [ -n "${BRANCH}" ]; then
        git clone -b "${BRANCH}" ${UDROID_REPO_URL} "${CACHE_ROOT}/ubuntu-on-android" || die "failed to clone repo ubuntu-on-android.."
        git clone -b "${BRANCH}" ${FSM_URL} "${CACHE_ROOT}/fs-manager-udroid" || die "failed to clone repo fs-manager-udroid"
    else
        git clone ${UDROID_REPO_URL} "${CACHE_ROOT}/ubuntu-on-android" || die "failed to clone repo ubuntu-on-android \"${BRANCH}\""
        git clone ${FSM_URL} "${CACHE_ROOT}/fs-manager-udroid" || die "failed to clone repo fs-manager-udroid \"${BRANCH}\""
    fi
    lshout "Done..."
    install
}

###################################
# * function install
#
# 1. chech for plugin and copy to proot-distro plugin folder
# 2. chech for fs-manager-udroid(udroid) install script in its root directory and run it
# 3. trigger udroid installation
# 4. show echo of installation complete and clear screen
# if anything goes wrong or any program in code fails kill the installation by calling die function

function install()
{
    shout "setting up proot-distro udroid implant..."
    sleep 3

    if [ -f "${CACHE_ROOT}"/ubuntu-on-android/udroid.sh ]; then
        cp "${CACHE_ROOT}"/ubuntu-on-android/plugins/udroid.sh ${SCRIPT_DIR}
    fi

    if [ -f "${CACHE_ROOT}"/fs-manager-udroid/install.sh ]; then
        oldpwd="$(pwd)"
        cd "${CACHE_ROOT}"/fs-manager-udroid || die "failed to cd ..."
        bash install.sh || die "failed to install manager..."
        cd "${oldpwd}" || die "error"
    fi

    shout "setup complete..."
}

_NOTICE_
setup_and_clone
