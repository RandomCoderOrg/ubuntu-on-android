![Screenshot_20210605-115657_VNC Viewer](https://user-images.githubusercontent.com/68287637/120882449-b4729680-c5f5-11eb-8a47-c452aefcc882.jpg "A Screenshot of ubuntu xfce showing some pre-installed apps")
![stage](https://img.shields.io/badge/Status-Installable-green) ![badge2](https://img.shields.io/badge/App-Termux-green) ![badge3](https://img.shields.io/badge/Linux%20Distribution-UBUNTU-brightgreen) ![bagge4](https://img.shields.io/badge/Linux%20Distribution__version-21.04%20(hippo)-brightgreen)

# ubuntu-on-android
A tweaked ubuntu-21.04 with xfce4 runs on android with termux/proot-distro

> This means now you can install ubuntu like above screenshot right in your smartphone without destroying your phone with rooting
> (let android and google live)

- codename -> `hippo`

### A note before you try
- As lot of it is preinstalled you can login and start right after you install 
- As this runs on termux so performence clearly depends on CPU, ram and storage read-write speed!
- Don't try heavy apps unless you have a good device :)
- And its in early stages of building so some things may look kind of bad or missing(make sure to notice me if you find any in issues)
- If you have any issues or suggestions make sure i know at https://github.com/RandomCoderOrg/ubuntu-on-android/issue (create an issue)

# installation
- first install termux from [termux.com](https://termux.com) or playstore!
```bash
# remove ubuntu-on-android folder if exists
rm -rf ubuntu-on-android
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
### logging into hippo
```bash
# run
proot-distro login hippo
```
### starting vncserver

```bash
vncserver :1
```
This step start GUI like screenshot above
it requires an app to see, its up to yourchoice but here are some recommended apps
- [RealVnc](https://play.google.com/store/apps/details?id=com.realvnc.viewer.android&hl=en_IN&gl=US) avalible in playstore
- [Nethunter KEX](https://store.nethunter.com/en/packages/com.offsec.nethunter.kex/) 
### stoping vncserver
```bash
vncserver --kill :1
```
> if you press `logout` button inside vnc no need to do this step
### Logout from hippo :)
```bash
exit
```

## 🔊  Audio 
If you cant hear audio from vnc then use this command by openning a new session in termux
```bash
pulseaudio --start --load-"module-native-protocol-tcp auth-ip-acp=127.0.0.1 auth-anonymus=1" --exit-idle-time=1
```
## Default passwords
`user` -> root



vnc password -> `ubuntu`


you can change it by command `vncpasswd`

A small help from me if you want to build your own rootfs [wiki_page](https://github.com/RandomCoderOrg/ubuntu-on-android/wiki/commands-took-to-make-a-custom-rootfs)
# Devolopers & credits
Made with ❤️ from:
DEV #0 -> [Saicharankandukuri](https://github.com/SaicharanKandukuri)

# Links to community
- create an [issue](https://github.com/RandomCoderOrg/ubuntu-on-android/issues) if you want to make me create one!

## More updates comming soon👊.
- feel free to contribute to this repo :)
