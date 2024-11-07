wget https://www.linuxfromscratch.org/patches/blfs/12.2/menu-cache-1.1.0-consolidated_fixes-1.patch -P ..
patch -Np1 -i ../menu-cache-1.1.0-consolidated_fixes-1.patch
./configure --prefix=/usr --disable-static 
make
make install

