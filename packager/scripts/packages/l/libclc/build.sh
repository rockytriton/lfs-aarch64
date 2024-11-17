mkdir build 
cd    build 

cmake -D CMAKE_INSTALL_PREFIX=/usr \
      -D CMAKE_BUILD_TYPE=Release  \
      -G Ninja ..                  
ninja


DESTDIR=$LFS_PCK_DIR ninja install
