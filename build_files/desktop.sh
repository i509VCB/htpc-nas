#!/bin/bash

set -ouex pipefail

# Install KDE Plasma, but only the mandatory packages.
dnf5 install --setopt=group_package_types="mandatory" -y \
  @kde-desktop

### "core" KDE Plasma packages
##
## These are required to be installed always or else things break.
##
## Some particular notes:
##
## - ffmpegthumbs, kdegraphics-thumbnailers: Dolphin file previews
dnf5 install -y \
  ark \
  dolphin \
  konsole \
  kde-connect \
  khelpcenter \
  kscreen \
  kwrite \
  plasma-discover \
  plasma-nm \
  plasma-print-manager \
  plasma-systemmonitor \
  plasma-thunderbolt \
  spectacle \
  ffmpegthumbs \
  kdegraphics-thumbnailers

## Multimedia apps which will rely on freeworld packages
dnf5 install -y vlc

## Steam requires non-free
dnf5 install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
  https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y

dnf5 install -y steam
