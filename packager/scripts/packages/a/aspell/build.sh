wget https://ftp.gnu.org/gnu/aspell/dict/en/aspell6-en-2020.12.07-0.tar.bz2 -P ..

./configure --prefix=/usr 
make
make DESTDIR=$LFS_PCK_DIR install

mkdir -p $LFS_PCK_DIR/usr/lib

ln -svfn aspell-0.60 $LFS_PCK_DIR/usr/lib/aspell 

install -v -m755 -d /usr/share/doc/aspell-0.60.8.1/aspell{,-dev}.html 

install -v -m644 manual/aspell.html/* \
    /usr/share/doc/aspell-0.60.8.1/aspell.html 

install -v -m644 manual/aspell-dev.html/* \
    /usr/share/doc/aspell-0.60.8.1/aspell-dev.html

mkdir -p $LFS_PCK_DIR/usr/bin/

install -v -m 755 scripts/ispell $LFS_PCK_DIR/usr/bin/

install -v -m 755 scripts/spell $LFS_PCK_DIR/usr/bin/

cp -r $LFS_PCK_DIR/* /

tar xf ../aspell6-en-2020.12.07-0.tar.bz2 
cd aspell6-en-2020.12.07-0                

./configure 
make
make DESTDIR=$LFS_PCK_DIR install
