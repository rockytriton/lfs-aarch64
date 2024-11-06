
./configure --prefix=/usr --disable-static 
make
make install
mkdir -v /usr/share/doc/libpng-1.6.43 &&
cp -v README libpng-manual.txt /usr/share/doc/libpng-1.6.43
