wget https://github.com/sass/libsass/archive/3.6.6/libsass-3.6.6.tar.gz -P ..

tar -xf ../libsass-3.6.6.tar.gz 
pushd libsass-3.6.6 

autoreconf -fi

./configure --prefix=/usr --disable-static 
make
make install

popd 
autoreconf -fi 

./configure --prefix=/usr 
make
make install
