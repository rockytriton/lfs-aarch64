if [   -e /opt/kf6/lib/libLayerShellQtInterface.so -a \
     ! -e /usr/lib/libLayerShellQtInterface.so ]; then

    ln -sv /opt/kf6/lib/libLayerShellQtInterface.so \
           /usr/lib/libLayerShellQtInterface.so
fi

mkdir build 
cd    build 

cmake -D CMAKE_INSTALL_PREFIX=/usr \
      -D CMAKE_BUILD_TYPE=Release  \
      ..  
make
make install

sed -e '/Categories=/s/=/=System;FileTools;/' \
    -e '/Name=/s/=.*/=File Manager PCManFM-Qt'/ \
    -i /usr/share/applications/pcmanfm-qt.desktop