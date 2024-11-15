
./configure --prefix=/usr                       \
            --docdir=/usr/share/doc/pcre2-10.44 \
            --enable-unicode                    \
            --enable-jit                        \
            --enable-pcre2-16                   \
            --enable-pcre2-32                   \
            --enable-pcre2grep-libz             \
            --enable-pcre2grep-libbz2           \
            --enable-pcre2test-libreadline      \
            --disable-static  
make
make DESTDIR=$LFS_PCK_DIR install

