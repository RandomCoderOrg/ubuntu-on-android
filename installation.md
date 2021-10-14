# Installation

- First install termux from [termux.com](https://termux.com) or [F-Droid!](https://f-droid.org/en/packages/com.termux/)
- For display, you can use [Xwayland](https://github.com/termux/termux-x11) too. 

### Video tutorial
https://youtu.be/iVF0swfqsKo

### Getting Sources and install scripts
```bash
# download installer
curl -L -o install.sh https://git.io/hippo-installer
# run the installer
bash install.sh
# Install ubuntu with this command
udroid --install
```
### Basic Usage
  | **Command**        | **Usage** |
  |--------------------|-----------|
  | `udroid`            | To login to shell |
  |  `udroid upgrade` | to upgrade fs or to get new features if available |
  | `startvnc`   | start vncserver at port `1` (you can change default port by exporting env varaible `DEFAULT_VNC_PORT` to a port number) |
  | `udroid stopvnc`    | stop vncserver at given or default port `1`
  | `udroid --enable-dbus` | To start udroid with dbus hack enabled |
  | `udroid --enable-dbus-vnc` | To start vnc session with dbus hack enabled |

### Env Variables
- `DEFAULT_VNC_PORT` to set vnc port for scripts
- `HIPPO_BRANCH` to set custom branch for cloning code

### Audio 
Pulseaudio starts everytime you invoke start commands with `udroid`

> You can start audio manually with this command
```bash
pulseaudio --start --load="module-native-protocol-tcp auth-ip-acl=127.0.0.1 auth-anonymous=1" --exit-idle-time=-1
```
### Default passwds for XFCE4

|  |password|
|--|--------|
| udroid user | `secret` |
|vncserver root | `secret` |

### Setting up Xwayland manually

First up of all install Termux-x11 from above link, in termux use
```
XDG_RUNTIME_DIR=$PREFIX/bin Xwayland -ac :1 > /dev/null &
```
This time start udroid with
```
proot-distro login udroid --shared-tmp
```
And then start Xfce4 on Xwayland via
```
DISPLAY=:1 xfce4-session
```

