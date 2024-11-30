
mkdir build 
cd    build 

../configure --prefix=/usr --disable-gpg-test 
make PYTHONS=
make DESTDIR=$LFS_PCK_DIR install PYTHONS=

