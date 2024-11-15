wget https://www.linuxfromscratch.org/patches/blfs/12.2/libcanberra-0.30-wayland-1.patch -P ..
patch -Np1 -i ../libcanberra-0.30-wayland-1.patch

./configure --prefix=/usr --disable-oss
make
make docdir=/usr/share/doc/libcanberra-0.30 install

