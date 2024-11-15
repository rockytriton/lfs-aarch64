make mrproper

make headers
find usr/include -type f ! -name '*.h' -delete

mkdir -p $LFS_PCK_DIR/usr
cp -rv usr/include $LFS_PCK_DIR/usr
