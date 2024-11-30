wget https://www.linuxfromscratch.org/patches/blfs/12.2/konsole-24.08.0-scrollbar-1.patch -P ..
patch -Np1 -i ../konsole-24.08.0-scrollbar-1.patch

mkdir build 
cd    build 

cmake -D CMAKE_INSTALL_PREFIX=$KF6_PREFIX \
      -D CMAKE_BUILD_TYPE=Release         \
      -D BUILD_TESTING=OFF                \
      -W no-dev ..
make
make DESTDIR=$LFS_PCK_DIR install

