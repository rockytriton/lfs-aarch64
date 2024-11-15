wget https://downloads.xiph.org/releases/speex/speexdsp-1.2.1.tar.gz -P ..

./configure --prefix=/usr    \
            --disable-static \
            --docdir=/usr/share/doc/speex-1.2.1 
make
make install

cd ..                          
tar -xf speexdsp-1.2.1.tar.gz 
cd speexdsp-1.2.1             

./configure --prefix=/usr    \
            --disable-static \
            --docdir=/usr/share/doc/speexdsp-1.2.1 
make
make install
