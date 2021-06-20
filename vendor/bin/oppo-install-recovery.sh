#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/by-name/recovery:134217728:5a001929b7aab0cef00fa0bcd9da7594acf6694d; then
  applypatch  \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/by-name/boot:33554432:e9cac47a92afbad65d19787c57d907186232dbaa \
          --target EMMC:/dev/block/by-name/recovery:134217728:5a001929b7aab0cef00fa0bcd9da7594acf6694d && \
      log -t recovery "Installing new oppo recovery image: succeeded" && \
      setprop ro.recovery.updated true || \
      log -t recovery "Installing new oppo recovery image: failed" && \
      setprop ro.recovery.updated false
else
  log -t recovery "Recovery image already installed"
  setprop ro.recovery.updated true
fi
