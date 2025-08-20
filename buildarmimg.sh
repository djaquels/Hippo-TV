#!/bin/bash
mkdir -p /var/lib/manjaro-arm-tools/pkg
mkdir -p /var/lib/manjaro-arm-tools/img
mkdir -p /var/lib/manjaro-arm-tools/tmp
mkdir -p /var/cache/manjaro-arm-tools/img
mkdir -p /var/cache/manjaro-arm-tools/pkg
sudo mkdir -p /usr/share/manjaro-arm-tools/profiles/arm-profiles/overlays/rpi3-hos-gnome
sudo cp rpi3-hos /usr/share/manjaro-arm-tools/profiles/arm-profiles/devices/
sudo cp rpi3-hos-gnome /usr/share/manjaro-arm-tools/profiles/arm-profiles/editions/
sudo cp /usr/share/manjaro-arm-tools/profiles/arm-profiles/services/gnome /usr/share/manjaro-arm-tools/profiles/arm-profiles/services/rpi3-hos-gnome
sudo cp -r /usr/share/manjaro-arm-tools/profiles/arm-profiles/overlays/gnome /usr/share/manjaro-arm-tools/profiles/arm-profiles/overlays/rpi3-hos-gnome
sudo cp functions.sh /usr/share/manjaro-arm-tools/lib
sudo buildarmimg  -d rpi3-hos -e rpi3-hos-gnome  -v 1.00 -n