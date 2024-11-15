echo '#define SYS_VIMRC_FILE "/etc/vimrc"' >> src/feature.h
./configure --prefix=/usr 
make
make DESTDIR=$LFS_PCK_DIR install

