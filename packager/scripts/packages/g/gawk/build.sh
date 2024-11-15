sed -i 's/extras//' Makefile.in
./configure --prefix=/usr 
make
rm -f /usr/bin/gawk-5.3.0
make DESTDIR=$LFS_PCK_DIR install
ln -sv gawk.1 $LFS_PCK_DIR/usr/share/man/man1/awk.1
