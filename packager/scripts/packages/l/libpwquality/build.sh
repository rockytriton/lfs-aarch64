
./configure --prefix=/usr                      \
            --disable-static                   \
            --with-securedir=/usr/lib/security \
            --disable-python-bindings          &&
make 

mkdir -p $LFS_PCK_DIR/tmp
pip3 wheel -w $LFS_PCK_DIR/tmp/dist --no-build-isolation --no-deps --no-cache-dir $PWD/python

make DESTDIR=$LFS_PCK_DIR install

