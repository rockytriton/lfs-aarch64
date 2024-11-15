
./configure --prefix=/usr 
make
make DESTDIR=$LFS_PCK_DIR install

rm -fv $LFS_PCK_DIR/usr/lib/libltdl.a
