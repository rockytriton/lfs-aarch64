wget https://github.com/cracklib/cracklib/releases/download/v2.10.2/cracklib-words-2.10.2.xz -P ..

./configure --prefix=/usr --disable-static --with-default-dict=/usr/lib/cracklib/pw_dict 
make
make DESTDIR=$LFS_PCK_DIR install

mkdir -p $LFS_PCK_DIR/usr/share/dict/

install -v -m644 -D    ../cracklib-words-2.10.2.xz \
                         $LFS_PCK_DIR/usr/share/dict/cracklib-words.xz    &&

unxz -v                  $LFS_PCK_DIR/usr/share/dict/cracklib-words.xz    &&
ln -v -sf cracklib-words $LFS_PCK_DIR/usr/share/dict/words                &&
echo $(hostname) >>      $LFS_PCK_DIR/usr/share/dict/cracklib-extra-words &&
install -v -m755 -d      $LFS_PCK_DIR/usr/lib/cracklib                   

