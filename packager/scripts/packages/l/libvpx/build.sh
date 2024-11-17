sed -i 's/cp -p/cp/' build/make/Makefile 

mkdir libvpx-build            &&
cd    libvpx-build            

../configure --prefix=/usr    \
             --enable-shared  \
             --disable-static
make
make DESTDIR=$LFS_PCK_DIR install

