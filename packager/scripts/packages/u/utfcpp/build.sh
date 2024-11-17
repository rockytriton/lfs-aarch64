mkdir build &&
cd    build 

cmake -D CMAKE_INSTALL_PREFIX=/usr ..
make DESTDIR=$LFS_PCK_DIR install

