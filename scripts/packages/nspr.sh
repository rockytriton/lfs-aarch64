cd nspr 

sed -i '/^RELEASE/s|^|#|' pr/src/misc/Makefile.in 
sed -i 's|$(LIBRARY) ||'  config/rules.mk         

./configure --prefix=/usr   \
            --with-mozilla  \
            --with-pthreads \
            $([ $(uname -m) = x86_64 ] && echo --enable-64bit) 

make
make install

