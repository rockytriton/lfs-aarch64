
mkdir build &&
cd    build 

cmake -D CMAKE_INSTALL_PREFIX=$KF6_PREFIX \
      -D CMAKE_PREFIX_PATH=$QT6DIR        \
      -D CMAKE_SKIP_INSTALL_RPATH=ON      \
      -D CMAKE_BUILD_TYPE=Release         \
      -D BUILD_TESTING=OFF                \
      -D QT_MAJOR_VERSION=6               \
      .. 
make
make DESTDIR=$LFS_PCK_DIR install

