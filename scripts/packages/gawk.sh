sed -i 's/extras//' Makefile.in
./configure --prefix=/usr 
make
rm -f /usr/bin/gawk-5.3.0
make install
ln -sv gawk.1 /usr/share/man/man1/awk.1
