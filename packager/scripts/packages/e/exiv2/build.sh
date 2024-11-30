
mkdir build 
cd    build 

cmake -D CMAKE_INSTALL_PREFIX=/usr   \
      -D CMAKE_BUILD_TYPE=Release    \
      -D EXIV2_ENABLE_VIDEO=yes      \
      -D EXIV2_ENABLE_WEBREADY=yes   \
      -D EXIV2_ENABLE_CURL=yes       \
      -D EXIV2_BUILD_SAMPLES=no      \
      -D CMAKE_SKIP_INSTALL_RPATH=ON \
      -G Ninja ..
ninja
DESTDIR=$LFS_PCK_DIR ninja install

