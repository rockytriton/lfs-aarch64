mkdir build 
cd    build 

cmake -D CMAKE_INSTALL_PREFIX=/usr -G Ninja .. 
ninja


DESTDIR=$LFS_PCK_DIR ninja install
