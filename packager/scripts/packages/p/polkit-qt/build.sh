
mkdir build
cd    build

cmake -D CMAKE_INSTALL_PREFIX=/usr \
      -D CMAKE_BUILD_TYPE=Release  \
      -D QT_MAJOR_VERSION=6        \
      -W no-dev .. 
make
make DESTDIR=$LFS_PCK_DIR install

