#!/usr/bin/env bash

# simple script to run dbus on start by SaicharanKandukuri

if [ ! -f /tmp/dbus-wake.lock ]; then
    service dbus start > /dev/null 2>&1
    touch /tmp/dbus-wake.lock
fi