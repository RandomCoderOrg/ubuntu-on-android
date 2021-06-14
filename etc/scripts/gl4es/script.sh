#!/usr/bin/env bash

h_dir=/root

echo -e
echo -e "Installing gl4es.. (This may take some time)"
echo -e

git clone https://github.com/RandomCoderOrg/gl4es-port ${h_dir}/gl4es-port

cd ${h_dir}/gl4es-port

apt update; apt install -y libx11-dev build-essential
sleep 1s

clear
mkdir build;cd build; cmake -S ../../gl4es-port; make install

echo
echo -e "Installing Done ... "
echo
sleep 1
clear

echo "ubuntu 21.04 | with pre-installed and xfce4 (gl4es powered).."
echo
echo "Here are the list of command to start you up:"
echo "apt update;apt upgrade -y  -> to upgrade your system"
echo "vncserver                  -> start vncserver at port 1"
echo "  password is ubuntu"
echo "vncserver --kill :1        -> to kill the server"
echo "exit                       -> to exit from the system"