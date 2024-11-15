
mkdir build &&
cd    build 

cmake -D CMAKE_INSTALL_PREFIX=/usr        \
      -D CMAKE_BUILD_TYPE=Release         \
      -D CMAKE_INSTALL_LIBEXECDIR=libexec \
      -D KDE_INSTALL_USE_QT_SYS_PATHS=ON  \
      -D BUILD_TESTING=OFF                \
      -W no-dev ..
make
make install

