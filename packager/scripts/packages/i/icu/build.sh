cd source
./configure --prefix=/usr 
make
make DESTDIR=$LFS_PCK_DIR install

