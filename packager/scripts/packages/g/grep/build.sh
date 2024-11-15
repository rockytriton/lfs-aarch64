sed -i "s/echo/#echo/" src/egrep.sh
./configure --prefix=/usr 
make
make DESTDIR=$LFS_PCK_DIR install

