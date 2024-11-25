wget https://www.linuxfromscratch.org/patches/blfs/12.2/cdparanoia-III-10.2-gcc_fixes-1.patch -P ..
wget https://raw.githubusercontent.com/rockytriton/pullinux-packages/refs/heads/main/c/cdparanoia-III/0001-Use-DESTDIR-in-install-Makefile-rule.patch -P ..


patch -Np1 -i ../cdparanoia-III-10.2-gcc_fixes-1.patch 
patch -Np1 -i ../0001-Use-DESTDIR-in-install-Makefile-rule.patch

./configure --prefix=/usr --mandir=/usr/share/man --build=aarch64-unknown-linux-gnu
make -j1
make DESTDIR=$LFS_PCK_DIR install

chmod -v 755 $LFS_PCK_DIR/usr/lib/libcdda_*
rm -fv $LFS_PCK_DIR/usr/lib/libcdda_*.a
