wget https://www.linuxfromscratch.org/patches/blfs/12.2/obconf-qt-0.16.4-qt6-1.patch -P ..
patch -Np1 -i ../obconf-qt-0.16.4-qt6-1.patch
mkdir __build
cd    __build
cmake -D CMAKE_INSTALL_PREFIX=/usr \
      -D CMAKE_BUILD_TYPE=Release  \
      ..     
make
make install
