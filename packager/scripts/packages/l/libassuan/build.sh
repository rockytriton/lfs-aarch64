
./configure --prefix=/usr 
make                      

make -C doc html                                                       
makeinfo --html --no-split -o doc/assuan_nochunks.html doc/assuan.texi 
makeinfo --plaintext       -o doc/assuan.txt           doc/assuan.texi

make DESTDIR=$LFS_PCK_DIR install


install -v -dm755   $LFS_PCK_DIR/usr/share/doc/libassuan-3.0.1/html 
install -v -m644 doc/assuan.html/* \
                    $LFS_PCK_DIR/usr/share/doc/libassuan-3.0.1/html 
install -v -m644 doc/assuan_nochunks.html \
                    $LFS_PCK_DIR/usr/share/doc/libassuan-3.0.1      
install -v -m644 doc/assuan.{txt,texi} \
                    $LFS_PCK_DIR/usr/share/doc/libassuan-3.0.1
