#!/bin/bash

set -ouex pipefail

# Enable RPMFusion
dnf5 -y install \
  https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-"$(rpm -E %fedora)".noarch.rpm \

### Install packages which provide additional/hardware codecs
dnf5 install -y \
  gstreamer1-plugins-bad-freeworld \
  gstreamer1-plugins-ugly \
  libavcodec-freeworld \
  mesa-va-drivers-freeworld \
  mesa-vulkan-drivers-freeworld \
  pipewire-codec-aptx \
  qt-heif-image-plugin \
  vlc-plugins-freeworld
