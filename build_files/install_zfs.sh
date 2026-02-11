#!/bin/bash

set -eoux pipefail

# provide ublue-akmods public_key for MOK enroll
dnf5 install -y \
  /tmp/akmods-common/rpms/ublue-os/ublue-os-akmods-addons*.rpm

KERNEL_RPMS=(
  /tmp/akmods-zfs/kernel-rpms/kernel-*.rpm
  /tmp/akmods-zfs/kernel-rpms/kernel-core-*.rpm
  /tmp/akmods-zfs/kernel-rpms/kernel-modules-*.rpm
  /tmp/akmods-zfs/kernel-rpms/kernel-modules-extra-*.rpm
)

ZFS_RPMS=(
  /tmp/akmods-zfs/rpms/kmods/zfs/kmod-zfs-*.rpm
  /tmp/akmods-zfs/rpms/kmods/zfs/libnvpair3-*.rpm
  /tmp/akmods-zfs/rpms/kmods/zfs/libuutil3-*.rpm
  /tmp/akmods-zfs/rpms/kmods/zfs/libzfs6-*.rpm
  /tmp/akmods-zfs/rpms/kmods/zfs/libzpool6-*.rpm
  /tmp/akmods-zfs/rpms/kmods/zfs/python3-pyzfs-*.rpm
  /tmp/akmods-zfs/rpms/kmods/zfs/zfs-*.rpm
  # Do not include dracut zfs rpm because root on ZFS is not used.
)

# Install ZFS
dnf5 install -y \
  "${KERNEL_RPMS[@]}" \
  "${ZFS_RPMS[@]}"

# Enable ZFS at boot always
echo "zfs" >/usr/lib/modules-load.d/zfs.conf

## Cleanup
rm -rf /tmp/akmods-common
rm -rf /tmp/akmods-zfs

# # To silence bootc lints, remove pcp and rpm-state as these are not needed.
# rm -rf /var/lib/pcp
# rm -rf /var/lib/rpm-state
