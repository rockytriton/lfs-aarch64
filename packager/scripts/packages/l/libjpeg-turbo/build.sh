
mkdir build 
cd    build 

cmake -D CMAKE_INSTALL_PREFIX=/usr        \
      -D CMAKE_BUILD_TYPE=RELEASE         \
      -D ENABLE_STATIC=FALSE              \
      -D CMAKE_INSTALL_DEFAULT_LIBDIR=lib \
      -D CMAKE_SKIP_INSTALL_RPATH=ON      \
      -D CMAKE_INSTALL_DOCDIR=/usr/share/doc/libjpeg-turbo-3.0.1 \
      ..

make
make install

