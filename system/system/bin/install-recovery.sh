#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/platform/bootdevice/by-name/recovery:33554432:a9698833c89f0d65650be934d5fa2da9ec75a665; then
  applypatch  \
          --patch /system/recovery-from-boot.p \
          --source EMMC:/dev/block/platform/bootdevice/by-name/boot:9797632:2e6cf4b46fcc7592bc2af355d415cd9f3125fead \
          --target EMMC:/dev/block/platform/bootdevice/by-name/recovery:33554432:a9698833c89f0d65650be934d5fa2da9ec75a665 && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
