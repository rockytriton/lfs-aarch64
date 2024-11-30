
mkdir _build &&
cd    _build &&

cmake -D CMAKE_INSTALL_PREFIX=/usr \
      -D CMAKE_BUILD_TYPE=Release  \
      -D BUILD_TESTING=OFF                \
      -W no-dev .. 
make
make DESTDIR=$LFS_PCK_DIR install

