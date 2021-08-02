#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/platform/bootdevice/by-name/recovery:33554432:ea6ba048ecb548fa42a8babdd6906acafe785220; then
  applypatch  \
          --patch /system/recovery-from-boot.p \
          --source EMMC:/dev/block/platform/bootdevice/by-name/boot:9736192:a30735cca05b86e2c7b35b757adc08214db7127f \
          --target EMMC:/dev/block/platform/bootdevice/by-name/recovery:33554432:ea6ba048ecb548fa42a8babdd6906acafe785220 && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
