wget https://www.linuxfromscratch.org/patches/blfs/12.2/gpm-1.20.7-consolidated-1.patch -P ..

patch -Np1 -i ../gpm-1.20.7-consolidated-1.patch                
./autogen.sh                                                    
./configure --prefix=/usr --sysconfdir=/etc ac_cv_path_emacs=no
make
make DESTDIR=$LFS_PCK_DIR install


rm -fv $LFS_PCK_DIR/usr/lib/libgpm.a                              
ln -sfv libgpm.so.2.1.0 $LFS_PCK_DIR/usr/lib/libgpm.so            

mkdir -p $LFS_PCK_DIR/etc
install -v -m644 conf/gpm-root.conf $LFS_PCK_DIR/etc              


. $SCRIPTS_PATH/extract.sh https://www.linuxfromscratch.org/blfs/downloads/12.2-systemd/blfs-systemd-units-20240801.tar.xz
make DESTDIR=$LFS_PCK_DIR install-gpm
