./bootstrap 
./configure --prefix=/usr \
            --docdir=/usr/share/doc/soundtouch-2.3.3 
make

make DESTDIR=$LFS_PCK_DIR install

