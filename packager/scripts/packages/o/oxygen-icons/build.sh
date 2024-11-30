sed -i '/( oxygen/ s/)/scalable )/' CMakeLists.txt

mkdir _build &&
cd    _build &&

cmake -D CMAKE_INSTALL_PREFIX=/usr -W no-dev ..

make DESTDIR=$LFS_PCK_DIR install

