
mkdir -v build 
cd       build 

cmake -D CMAKE_BUILD_TYPE=Release  \
      -D CMAKE_INSTALL_PREFIX=/usr \
      -D BUILD_STATIC_LIBS=OFF ..
make
make DESTDIR=$LFS_PCK_DIR install

