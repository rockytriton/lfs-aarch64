
sed -e '/install -m 644 $(LIBNEWT)/ s/^/#/' \
    -e '/$(LIBNEWT):/,/rv/ s/^/#/'          \
    -e 's/$(LIBNEWT)/$(LIBNEWTSH)/g'        \
    -i Makefile.in                          

./configure --prefix=/usr           \
            --with-gpm-support      \
            --with-python=python3.12
make
make DESTDIR=$LFS_PCK_DIR install

