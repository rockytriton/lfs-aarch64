
mkdir build 
cd    build 

cmake -D CMAKE_INSTALL_PREFIX=/usr \
      -D BUILD_TESTING=OFF         \
      -W no-dev ..
make DESTDIR=$LFS_PCK_DIR install

