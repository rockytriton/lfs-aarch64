wget https://github.com/Xubuntu/lightdm-gtk-greeter/releases/download/lightdm-gtk-greeter-2.0.9/lightdm-gtk-greeter-2.0.9.tar.gz -P ..

groupadd -g 65 lightdm       &&
useradd  -c "Lightdm Daemon" \
         -d /var/lib/lightdm \
         -u 65 -g lightdm    \
         -s /bin/false lightdm

./configure --prefix=/usr                 \
            --libexecdir=/usr/lib/lightdm \
            --localstatedir=/var          \
            --sbindir=/usr/bin            \
            --sysconfdir=/etc             \
            --disable-static              \
            --disable-tests               \
            --with-greeter-user=lightdm   \
            --with-greeter-session=lightdm-gtk-greeter \
            --docdir=/usr/share/doc/lightdm-1.32.0 

make
make DESTDIR=$LFS_PCK_DIR install

mkdir -p $LFS_PCK_DIR/usr/bin/
mkdir -p $LFS_PCK_DIR/var/lib/
mkdir -p $LFS_PCK_DIR/var/cache
mkdir -p $LFS_PCK_DIR/var/log


cp tests/src/lightdm-session $LFS_PCK_DIR/usr/bin                         
sed -i '1 s/sh/bash --login/' $LFS_PCK_DIR/usr/bin/lightdm-session        
rm -rf $LFS_PCK_DIR/etc/init                                              
install -v -dm755 -o lightdm -g lightdm $LFS_PCK_DIR/var/lib/lightdm      
install -v -dm755 -o lightdm -g lightdm $LFS_PCK_DIR/var/lib/lightdm-data 
install -v -dm755 -o lightdm -g lightdm $LFS_PCK_DIR/var/cache/lightdm    
install -v -dm770 -o lightdm -g lightdm $LFS_PCK_DIR/var/log/lightdm

cp -r $LFS_PCK_DIR/* /

tar -xf ../lightdm-gtk-greeter-2.0.9.tar.gz 
cd lightdm-gtk-greeter-2.0.9 

./configure --prefix=/usr                 \
            --libexecdir=/usr/lib/lightdm \
            --sbindir=/usr/bin            \
            --sysconfdir=/etc             \
            --with-libxklavier            \
            --enable-kill-on-sigterm      \
            --disable-libido              \
            --disable-libindicator        \
            --disable-static              \
            --disable-maintainer-mode     \
            --docdir=/usr/share/doc/lightdm-gtk-greeter-2.0.9 
make

make DESTDIR=$LFS_PCK_DIR install


. $SCRIPTS_PATH/extract.sh https://www.linuxfromscratch.org/blfs/downloads/12.2-systemd/blfs-systemd-units-20240801.tar.xz
make DESTDIR=$LFS_PCK_DIR install-lightdm

