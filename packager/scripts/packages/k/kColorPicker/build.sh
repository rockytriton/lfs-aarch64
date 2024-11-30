
mkdir _build &&
cd    _build &&

cmake -D CMAKE_INSTALL_PREFIX=/usr \
      -D CMAKE_BUILD_TYPE=Release  \
      -D BUILD_SHARED_LIBS=ON      \
      -D BUILD_WITH_QT6=ON         \
      .. 
make
make DESTDIR=$LFS_PCK_DIR install

