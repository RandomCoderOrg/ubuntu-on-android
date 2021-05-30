# ubuntu-on-android

## ubuntu 21.04 raw
ubuntu 21.04 raw tarballs from cdimage ubuntu
> untouched

## Installation

### stage 1
```bash
# Clone the repo (branch raw)
git clone -b raw https://github.com/saicharankandukuri/ubuntu-on-android
# cd to folder
cd ubuntu-on-android
# run the installer
bash install.sh
```
### stage 2
```bash
proot-distro install hippo-raw
```
## supported os architecture 
- [X] arm64
- [X] armhf(armv7l|armv8l)
- [X] amd64
