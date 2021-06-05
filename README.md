# ubuntu-on-android
A tweaked ubuntu-21.04 with xfce4 runs on android with termux/proot-distro

![stage](https://img.shields.io/badge/Status-Installable-green)

its called `hippo`

### A note before you try
- As lot of it is preinstalled you can login and start right after you install 
- And its in early stages of building so things may look kind of bad (make sure to notice me if you find any in issues)
- If you have any issues or suggestions make sure i know at https://github.com/RandomCoderOrg/ubuntu-on-android/issue (create an issue)

# installation
- first install termux from [termux.com](https://termux.com) or playstore!
```bash
# install dependencies
apt update; apt upgrade -y ; apt install -y pulseaudio proot-distro git -y
# clone the code
git clone https://github.com/RandomCoderOrg/ubuntu-on-android
# run the installer
cd ubuntu-on-android
bash install.sh
# install
proot-distro install hippo
```
## logging into hippo
```bash
# run
proot-distro login hippo --user ubuntu
```
## starting vncserver
```bash
vncserver :1
```
## stoping vncserver
```bash
vncserver --kill :1
```
## Logout from hippo :)
```bash
exit
```
### Default passwords
`user` -> ubuntu



user password -> `ubuntu`


you can change by command `passwd`


vnc password -> `ubuntu`


you can change it by command `vncpasswd`

A small help from me if you want to build your own rootfs [wiki_page](https://github.com/RandomCoderOrg/ubuntu-on-android/wiki/commands-took-to-make-a-custom-rootfs)
## More updates comming soon👊.
- Update to stable in 1 day
