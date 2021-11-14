#!/usr/bin/env bash

####################################################
# UDROID installer Script V01 (mad installer)
# A script made by @zman-1x1 saicharankandukuri
# Copyright (c) 2021 Saicharan Kandukuri <hello.1x1.sai@gmail.com>


version="01"
version_code_name="mad installer mi01"
installer_authors="saicharankandukuri"

# * Deafault color is Blue
RST="\e[0m"
RED="\e[1;31m" # *This is bold
GREEN="\e[1;32m"
BLUE="\e[34m"
DC=${BLUE}

#GREEN_THIN="\e[32m"

# * Used for testing
# if set then installer clones code from specified branch (sensitive)
if [ -n "$HIPPO_BRANCH" ]; then
    BRANCH="$HIPPO_BRANCH"
fi


# CACHE_ROOT is the place where are download caches are stored
CACHE_ROOT="${HOME}/.uoa-cache-root"

# TPREFIX where root of termux starts
TPREFIX="/data/data/com.termux/files"

# BIN_DIR where binary files are stored in termux
# * (like /bin in traditional linux)
BIN_DIR="${TPREFIX}/usr/bin"

# INSTALL_FOLDER variable points to folder location where the file systems are installed in proot-distro
# * used when checking for hippo
INSTALL_FOLDER="${TPREFIX}/usr/var/lib/proot-distro/installed-rootfs"

# UDROID_DIR variable points to folder where hippo root filesystem is in
UDROID_DIR="${INSTALL_FOLDER}/udroid"

# SCRIPT_DIR variable points to folder where plugins for proot-distro is stored
# * this is where hippo.sh plugin goes

SCRIPT_DIR="${TPREFIX}/usr/etc/proot-distro/"

# HIPPO_REPO_URL & FSM_URL are github repo urls later used to clone the code
HIPPO_REPO_URL="https://github.com/RandomCoderOrg/ubuntu-on-android"
FSM_URL="https://github.com/RandomCoderOrg/fs-manager-udroid"

# DEPENDS programs required to run Hippo
# * proot-distro - A proot manager tool
#                  (which starts hippo)
# * git          - the stupid content tracker
#                  (used to copy code from github repo)
# * pulseaudo    - PulseAudio is a networked low-latency sound server for Linux
#                  (which is used to get audio from hippo using moudle-tcp*)
# * Others dependencies like tar comes pre-loaded in termux so no need to mention
DEPENDS="proot-distro pulseaudio git"


# * Usefull functions
# die()     exit with code 1 with printing given string
# warn()    like die() without exit status (used when exit is not necessary)
# shout()   pring messege in a good way with some lines
# lshout()  print messege in a standard way

die    () { echo -e "${RED}!!: ${*}${RST}";exit 1 ;:;}
warn   () { echo -e "${RED}??: ${*}${RST}";:;}
shout  () { echo -e "${DC}-----";echo -e "${*}";echo -e "-----${RST}";:; }
lshout () { echo -e "${DC}${*}${RST}";:; }


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
# 3. clone code from links in HIPPO_REPO_URL & FSM_URL
# 4. call install function
# if anything goes wrong or any program in code fails kill the installation by calling die function

function _NOTICE_()
{
    if [ ! -f ~/.udroid_notice.lock ]; then
        touch ~/.udroid_notice.lock
        shout "The Code name for this ubuntu is chaned from \"hippo\" to \"udroid\""
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
        git clone -b "${BRANCH}" ${HIPPO_REPO_URL} "${CACHE_ROOT}/ubuntu-on-android" || die "failed to clone repo ubuntu-on-android.."
        git clone -b "${BRANCH}" ${FSM_URL} "${CACHE_ROOT}/fs-manager-udroid" || die "failed to clone repo fs-manager-udroid"
    else
        git clone ${HIPPO_REPO_URL} "${CACHE_ROOT}/ubuntu-on-android" || die "failed to clone repo ubuntu-on-android \"${BRANCH}\""
        git clone ${FSM_URL} "${CACHE_ROOT}/fs-manager-udroid" || die "failed to clone repo fs-manager-udroid \"${BRANCH}\""
    fi
    lshout "Done..."
    install
}

###################################
# * function install
#
# 1. chech for plugin and copy to proot-distro plugin folder
# 2. chech for fs-manager-udroid(hippo) install script in its root directory and run it
# 3. trigger hippo installation
# 4. show echo of installation complete and clear screen
# if anything goes wrong or any program in code fails kill the installation by calling die function

function install()
{
    shout "setting up proot-distro udroid implant..."

    sleep 3

    if [ -f ${SCRIPT_DIR} ]; then
        mv ${SCRIPT_DIR} "${SCRIPT_DIR}1"
    fi

    if [ -f "${CACHE_ROOT}"/ubuntu-on-android/udroid.sh ]; then
        cp "${CACHE_ROOT}"/ubuntu-on-android/plugins/udroid.sh ${SCRIPT_DIR}
    fi

    if [ -f "${CACHE_ROOT}"/fs-manager-udroid/install.sh ]; then
        oldpwd="$(pwd)"
        cd "${CACHE_ROOT}"/fs-manager-udroid || die "failed to cd ..."
        bash install.sh || die "failed to install manager..."
        cd "${oldpwd}" || die "error"
    fi


    shout "setup complete...\nNow you can install and login with comand ${GREEN}udroid${DC} \nfor info use udroid --help"
    lshout "for additional documentation see: https://github.com/RandomCoderOrg/ubuntu-on-android#basic-usage"
    lshout "report issues and feature requests at: https://github.com/RandomCoderOrg/ubuntu-on-android/issues"
    lshout "Join Our discord server: https://discord.gg/u7KDGUc3Aw"

}

_NOTICE_
setup_and_clone
