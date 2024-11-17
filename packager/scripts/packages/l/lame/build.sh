
sed -i -e 's/^\(\s*hardcode_libdir_flag_spec\s*=\).*/\1/' configure

./configure --prefix=/usr --enable-mp3rtp --disable-static
make
make DESTDIR=$LFS_PCK_DIR pkghtmldir=/usr/share/doc/lame-3.100 install