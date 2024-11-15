

sed -e '/TryExec/s|=|=/usr/bin/|' \
    -i xsession/lxqt.desktop.in 

mkdir build 
cd    build 

cmake -D CMAKE_INSTALL_PREFIX=/usr \
      -D CMAKE_BUILD_TYPE=Release  \
      ..
make
make install

