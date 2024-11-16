install -v -g sys -m700 -d /var/lib/sshd 

groupadd -g 50 sshd   &&     
useradd  -c 'sshd PrivSep' \
         -d /var/lib/sshd  \
         -g sshd           \
         -s /bin/false     \
         -u 50 sshd

./configure --prefix=/usr                            \
            --sysconfdir=/etc/ssh                    \
            --with-privsep-path=/var/lib/sshd        \
            --with-default-path=/usr/bin             \
            --with-superuser-path=/usr/sbin:/usr/bin \
            --with-pid-dir=/run    

make
make DESTDIR=$LFS_PCK_DIR install

mkdir -p $LFS_PCK_DIR/usr/bin
mkdir -p $LFS_PCK_DIR/usr/share/man/man1
mkdir -p $LFS_PCK_DIR/usr/share/doc

install -v -m755    contrib/ssh-copy-id $LFS_PCK_DIR/usr/bin     

install -v -m644    contrib/ssh-copy-id.1 \
                    $LFS_PCK_DIR/usr/share/man/man1              
install -v -m755 -d $LFS_PCK_DIR/usr/share/doc/openssh-9.8p1     
install -v -m644    INSTALL LICENCE OVERVIEW README* \
                    $LFS_PCK_DIR/usr/share/doc/openssh-9.8p1

mkdir -p $LFS_PCK_DIR/etc/pam.d/
mkdir -p $LFS_PCK_DIR/etc/ssh/

sed 's@d/login@d/sshd@g' /etc/pam.d/login > $LFS_PCK_DIR/etc/pam.d/sshd &&
chmod 644 $LFS_PCK_DIR/etc/pam.d/sshd 
echo "UsePAM yes" >> $LFS_PCK_DIR/etc/ssh/sshd_config

. $SCRIPTS_PATH/extract.sh https://www.linuxfromscratch.org/blfs/downloads/12.2-systemd/blfs-systemd-units-20240801.tar.xz
make DESTDIR=$LFS_PCK_DIR install-sshd


