
mkdir build 
cd    build 

cmake -D CMAKE_INSTALL_PREFIX=/usr \
      -D BUILD_SHARED_LIBS=ON      \
      -D BUILD_TESTING=ON          \
      .. 
make
make DESTDIR=$LFS_PCK_DIR install

