wget https://www.linuxfromscratch.org/patches/blfs/12.2/docbook-xsl-nons-1.79.2-stack_fix-1.patch -P ..

patch -Np1 -i ../docbook-xsl-nons-1.79.2-stack_fix-1.patch

install -v -m755 -d $LFS_PCK_DIR/usr/share/xml/docbook/xsl-stylesheets-nons-1.79.2 

cp -v -R VERSION assembly common eclipse epub epub3 extensions fo        \
         highlighting html htmlhelp images javahelp lib manpages params  \
         profiling roundtrip slides template tests tools webhelp website \
         xhtml xhtml-1_1 xhtml5                                          \
    $LFS_PCK_DIR/usr/share/xml/docbook/xsl-stylesheets-nons-1.79.2 

ln -s VERSION $LFS_PCK_DIR/usr/share/xml/docbook/xsl-stylesheets-nons-1.79.2/VERSION.xsl 

install -v -m644 -D README \
                    $LFS_PCK_DIR/usr/share/doc/docbook-xsl-nons-1.79.2/README.txt 
install -v -m644    RELEASE-NOTES* NEWS* \
                    $LFS_PCK_DIR/usr/share/doc/docbook-xsl-nons-1.79.2

