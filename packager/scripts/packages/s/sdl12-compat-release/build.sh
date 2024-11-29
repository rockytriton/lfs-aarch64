
mkdir build 
cd    build 

cmake -D CMAKE_INSTALL_PREFIX=/usr \
      -D CMAKE_BUILD_TYPE=RELEASE  \
      ..
make
make DESTDIR=$LFS_PCK_DIR install

rm -vf $LFS_PCK_DIR/usr/lib/libSDLmain.a
