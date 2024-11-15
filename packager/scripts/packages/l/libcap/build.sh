sed -i '/install -m.*STA/d' libcap/Makefile

make prefix=/usr lib=lib
make DESTDIR=$LFS_PCK_DIR prefix=/usr lib=lib install
