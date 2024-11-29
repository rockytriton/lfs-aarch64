
mkdir _build &&
cd    _build &&

cmake -D CMAKE_INSTALL_PREFIX=/usr \
      -D CMAKE_BUILD_TYPE=Release  \
      -D PHONON_BUILD_QT5=OFF      \
      .. 
make
make DESTDIR=$LFS_PCK_DIR install

