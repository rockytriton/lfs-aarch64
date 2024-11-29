
cd nspr 

sed -i '/^RELEASE/s|^|#|' pr/src/misc/Makefile.in 
sed -i 's|$(LIBRARY) ||'  config/rules.mk         

./configure --prefix=/usr   \
            --with-mozilla  \
            --with-pthreads \
            $(echo --enable-64bit) 
make
make DESTDIR=$LFS_PCK_DIR install

