
make mrproper

cp $SCRIPTS_PATH/vmlinuz-6.10.5.config .config


make
make modules_install

cp -iv arch/arm64/boot/Image.gz /boot/vmlinuz-6.10.5-lfs-12.2-systemd
cp -iv .config /boot/config-6.10.5
