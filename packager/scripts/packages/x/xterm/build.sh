
sed -i '/v0/{n;s/new:/new:kb=^?:/}' termcap 
printf '\tkbs=\\177,\n' >> terminfo 

TERMINFO=/usr/share/terminfo \
./configure $XORG_CONFIG     \
    --with-app-defaults=/etc/X11/app-defaults

make
make DESTDIR=$LFS_PCK_DIR install

mkdir -pv $LFS_PCK_DIR/usr/share/applications 
cp -v *.desktop $LFS_PCK_DIR/usr/share/applications/
