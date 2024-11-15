
make mrproper

cp $SCRIPTS_PATH/vmlinuz-6.10.5.config .config

make

mkdir -p $LFS_PCK_DIR/lib/modules
mkdir -p $LFS_PCK_DIR/boot

make INSTALL_MOD_PATH=$LFS_PCK_DIR modules_install

cp -iv arch/arm64/boot/Image.gz $LFS_PCK_DIR/boot/vmlinuz-6.10.5-lfs-12.2-systemd
cp -iv .config $LFS_PCK_DIR/boot/config-6.10.5
