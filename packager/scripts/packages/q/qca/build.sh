
mkdir _build &&
cd    _build &&

cmake -D CMAKE_INSTALL_PREFIX=$QT6DIR            \
      -D CMAKE_BUILD_TYPE=Release                \
      -D QT6=ON                                  \
      -D QCA_INSTALL_IN_QT_PREFIX=ON             \
      -D QCA_MAN_INSTALL_DIR:PATH=/usr/share/man \
      ..
make
make DESTDIR=$LFS_PCK_DIR install

