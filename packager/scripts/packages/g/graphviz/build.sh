
sed -i '/LIBPOSTFIX="64"/s/64//' configure.ac 

./autogen.sh              
./configure --prefix=/usr \
            --docdir=/usr/share/doc/graphviz-12.1.0

sed -i "s/0/$(date +%Y%m%d)/" builddate.h

make
make DESTDIR=$LFS_PCK_DIR install

