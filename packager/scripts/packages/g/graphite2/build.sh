
sed -i '/cmptest/d' tests/CMakeLists.txt

mkdir build 
cd    build 

cmake -D CMAKE_INSTALL_PREFIX=/usr .. 
make
make DESTDIR=$LFS_PCK_DIR install

