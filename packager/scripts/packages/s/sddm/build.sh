groupadd -g 64 sddm &&
useradd  -c "sddm Daemon" \
         -d /var/lib/sddm \
         -u 64 -g sddm    \
         -s /bin/false sddm || echo "user created already"

mkdir build 
cd    build 

cmake -D CMAKE_INSTALL_PREFIX=/usr \
      -D CMAKE_BUILD_TYPE=Release  \
      -D RUNTIME_DIR=/run/sddm     \
      -D BUILD_MAN_PAGES=ON        \
      -D BUILD_WITH_QT6=ON         \
      -D DATA_INSTALL_DIR=/usr/share/sddm \
      -D DBUS_CONFIG_FILENAME=sddm_org.freedesktop.DisplayManager.conf \
      .. 
make
make DESTDIR=$LFS_PCK_DIR install

