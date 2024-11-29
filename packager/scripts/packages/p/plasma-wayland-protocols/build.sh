
mkdir _build &&
cd    _build 

cmake -D CMAKE_INSTALL_PREFIX=/usr .. 
make
make DESTDIR=$LFS_PCK_DIR install

