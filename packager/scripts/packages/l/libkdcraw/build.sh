
mkdir _build &&
cd    _build &&

cmake -D CMAKE_INSTALL_PREFIX=$KF6_PREFIX \
      -D CMAKE_BUILD_TYPE=Release         \
      -D BUILD_TESTING=OFF                \
      -D QT_MAJOR_VERSION=6               \
      -W no-dev ..
make
make DESTDIR=$LFS_PCK_DIR install

