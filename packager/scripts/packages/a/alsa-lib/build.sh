wget https://www.alsa-project.org/files/pub/lib/alsa-ucm-conf-1.2.12.tar.bz2 -P ..

./configure 
make
make DESTDIR=$LFS_PCK_DIR install

tar -C $LFS_PCK_DIR/usr/share/alsa --strip-components=1 -xf ../alsa-ucm-conf-1.2.12.tar.bz2
