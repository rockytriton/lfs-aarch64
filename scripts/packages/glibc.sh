cp /sources/glibc-2.40-fhs-1.patch ..
cp /sources/tzdata2024a.tar.gz ..

patch -Np1 -i ../glibc-2.40-fhs-1.patch

mkdir -v build
cd       build

echo "rootsbindir=/usr/sbin" > configparms

../configure --prefix=/usr                            \
             --disable-werror                         \
             --enable-kernel=4.19                     \
             --enable-stack-protector=strong          \
             --disable-nscd                           \
             libc_cv_slibdir=/usr/lib

make

mkdir -p $LFS_PCK_DIR/etc

touch $LFS_PCK_DIR/etc/ld.so.conf
sed '/test-installation/s@$(PERL)@echo not running@' -i ../Makefile

make DESTDIR=$LFS_PCK_DIR install

sed '/RTLDLIST=/s@/usr@@g' -i $LFS_PCK_DIR/usr/bin/ldd

mkdir -p $LFS_PCK_DIR/usr/lib/locale/

localedef -i C -f UTF-8 $LFS_PCK_DIR/usr/lib/locale/C.UTF-8 
localedef -i en_US -f ISO-8859-1 $LFS_PCK_DIR/usr/lib/locale/en_US
localedef -i en_US -f UTF-8 $LFS_PCK_DIR/usr/lib/locale/en_US.UTF-8

cat > $LFS_PCK_DIR/etc/nsswitch.conf << "EOF"
# Begin /etc/nsswitch.conf

passwd: files systemd
group: files systemd
shadow: files systemd

hosts: mymachines resolve [!UNAVAIL=return] files myhostname dns
networks: files

protocols: files
services: files
ethers: files
rpc: files

# End /etc/nsswitch.conf
EOF

tar -xf ../../tzdata2024a.tar.gz

ZONEINFO=$LFS_PCK_DIR/usr/share/zoneinfo
mkdir -pv $ZONEINFO/{posix,right}

for tz in etcetera southamerica northamerica europe africa antarctica  \
          asia australasia backward; do
    zic -L /dev/null   -d $ZONEINFO       ${tz}
    zic -L /dev/null   -d $ZONEINFO/posix ${tz}
    zic -L leapseconds -d $ZONEINFO/right ${tz}
done

cp -v zone.tab zone1970.tab iso3166.tab $ZONEINFO
zic -d $ZONEINFO -p America/New_York
unset ZONEINFO

ln -sfv /usr/share/zoneinfo/America/Chicago $LFS_PCK_DIR/etc/localtime

cat > $LFS_PCK_DIR/etc/ld.so.conf << "EOF"
# Begin /etc/ld.so.conf
/usr/local/lib
/opt/lib

# Add an include directory
include /etc/ld.so.conf.d/*.conf

EOF

mkdir -pv $LFS_PCK_DIR/etc/ld.so.conf.d

