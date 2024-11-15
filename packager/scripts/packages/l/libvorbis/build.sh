
./configure --prefix=/usr --disable-static 
make
make install

install -v -m644 doc/Vorbis* /usr/share/doc/libvorbis-1.3.7