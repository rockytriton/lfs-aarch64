
mkdir bld &&
cd    bld &&

cmake -D CMAKE_INSTALL_PREFIX=/usr -D GIT_ARCHETYPE=1 \
      -W no-dev ../source 
make
make DESTDIR=$LFS_PCK_DIR install

rm -vf $LFS_PCK_DIR/usr/lib/libx265.a
