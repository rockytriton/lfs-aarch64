cp $SCRIPTS_PATH/packages/n/noto-fonts/noto-sans.txz .
tar -xf noto-sans.txz

install -v -d -m755 $LFS_PCK_DIR/usr/share/fonts/noto-sans 
install -v -m644 static/*.ttf $LFS_PCK_DIR/usr/share/fonts/noto-sans 

