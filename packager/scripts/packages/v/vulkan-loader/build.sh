mkdir build 
cd    build 

cmake -D CMAKE_INSTALL_PREFIX=/usr   \
      -D CMAKE_BUILD_TYPE=Release    \
      -D CMAKE_SKIP_INSTALL_RPATH=ON \
      -G Ninja .. 
ninja

DESTDIR=$LFS_PCK_DIR ninja install
