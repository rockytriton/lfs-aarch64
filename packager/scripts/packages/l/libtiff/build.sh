mkdir -p libtiff-build 
cd       libtiff-build 

cmake -D CMAKE_INSTALL_DOCDIR=/usr/share/doc/libtiff-4.6.0 \
      -D CMAKE_INSTALL_PREFIX=/usr -G Ninja .. 
ninja
DESTDIR=$LFS_PCK_DIR ninja install
