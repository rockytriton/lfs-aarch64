wget https://www.linuxfromscratch.org/patches/blfs/12.2/libmad-0.15.1b-fixes-1.patch -P ..

patch -Np1 -i ../libmad-0.15.1b-fixes-1.patch                
sed "s@AM_CONFIG_HEADER@AC_CONFIG_HEADERS@g" -i configure.ac 
touch NEWS AUTHORS ChangeLog                                 
autoreconf -fi 

./configure --prefix=/usr --disable-static 
make
make DESTDIR=$LFS_PCK_DIR install

mkdir -p $LFS_PCK_DIR/usr/lib/pkgconfig/

cat > $LFS_PCK_DIR/usr/lib/pkgconfig/mad.pc << "EOF"
prefix=/usr
exec_prefix=${prefix}
libdir=${exec_prefix}/lib
includedir=${prefix}/include

Name: mad
Description: MPEG audio decoder
Requires:
Version: 0.15.1b
Libs: -L${libdir} -lmad
Cflags: -I${includedir}
EOF
