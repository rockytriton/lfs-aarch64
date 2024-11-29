
./configure --prefix=/usr --disable-static --build=aarch64-unknown-linux-gnu
make
make DESTDIR=$LFS_PCK_DIR docdir=/usr/share/doc/libdaemon-0.14 install

