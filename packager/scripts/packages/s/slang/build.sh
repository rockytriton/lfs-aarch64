
./configure --prefix=/usr \
            --sysconfdir=/etc \
            --with-readline=gnu 
make -j1 RPATH=
make DESTDIR=$LFS_PCK_DIR install_doc_dir=$LFS_PCK_DIR/usr/share/doc/slang-2.3.3   \
     SLSH_DOC_DIR=$LFS_PCK_DIR/usr/share/doc/slang-2.3.3/slsh \
     RPATH= install

