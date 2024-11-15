
python3 -c 'from pty import spawn; spawn(["echo", "ok"])'

cp /sources/expect-5.45.4-gcc14-1.patch ..

patch -Np1 -i ../expect-5.45.4-gcc14-1.patch


./configure --prefix=/usr           \
            --with-tcl=/usr/lib     \
            --enable-shared         \
            --disable-rpath         \
            --mandir=/usr/share/man \
            --with-tclinclude=/usr/include \
            --build=aarch64-unknown-linux-gnu
make
make install

echo linking...
ln -svf expect5.45.4/libexpect5.45.4.so /usr/lib
echo linked.
