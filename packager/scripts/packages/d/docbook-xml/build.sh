
install -v -d -m755 $LFS_PCK_DIR/usr/share/xml/docbook/xml-dtd-4.5 
install -v -d -m755 $LFS_PCK_DIR/etc/xml 
cp -v -af --no-preserve=ownership docbook.cat *.dtd ent/ *.mod \
    $LFS_PCK_DIR/usr/share/xml/docbook/xml-dtd-4.5

