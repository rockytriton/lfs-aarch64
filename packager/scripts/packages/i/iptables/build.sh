
./configure --prefix=/usr      \
            --disable-nftables \
            --enable-libipq
make
make DESTDIR=$LFS_PCK_DIR install

