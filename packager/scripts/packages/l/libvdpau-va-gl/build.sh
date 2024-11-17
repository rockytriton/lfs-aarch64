mkdir build 
cd    build 

cmake -D CMAKE_BUILD_TYPE=Release -D CMAKE_INSTALL_PREFIX=$XORG_PREFIX ..

make
make DESTDIR=$LFS_PCK_DIR install

