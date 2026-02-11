#!/bin/bash

set -ouex pipefail

dnf5 install -y flatpak

# Enable flathub and disable the fedora repo
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

FLATPAKS=(
  com.usebottles.bottles
  com.valvesoftware.Steam
  org.kde.elisa
  org.mozilla.firefox
)

flatpak install -y "${FLATPAKS[@]}"
