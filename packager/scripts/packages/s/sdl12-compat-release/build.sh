
mkdir build 
cd    build 

cmake -D CMAKE_INSTALL_PREFIX=/usr \
      -D CMAKE_BUILD_TYPE=RELEASE  \
      ..
make
make install

rm -vf /usr/lib/libSDLmain.a
