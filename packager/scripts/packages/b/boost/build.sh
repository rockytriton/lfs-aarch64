wget https://www.linuxfromscratch.org/patches/blfs/12.2/boost-1.86.0-upstream_fixes-1.patch -P ..
patch -Np1 -i ../boost-1.86.0-upstream_fixes-1.patch

./bootstrap.sh --prefix=/usr --with-python=python3 
./b2 stage -j$(nproc) threading=multi link=shared

./b2 install threading=multi link=shared