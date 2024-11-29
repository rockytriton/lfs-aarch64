
cd libraries/liblmdb 
make                 
sed -i 's| liblmdb.a||' Makefile

make prefix=/usr DESTDIR=$LFS_PCK_DIR install
