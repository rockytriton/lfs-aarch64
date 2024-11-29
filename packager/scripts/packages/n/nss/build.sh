wget https://www.linuxfromscratch.org/patches/blfs/12.2/nss-3.103-standalone-1.patch -P ..

patch -Np1 -i ../nss-3.103-standalone-1.patch 

cd nss 

make BUILD_OPT=1                      \
  NSPR_INCLUDE_DIR=/usr/include/nspr  \
  USE_SYSTEM_ZLIB=1                   \
  ZLIB_LIBS=-lz                       \
  NSS_ENABLE_WERROR=0                 \
  $(echo USE_64=1) \
  $(echo NSS_USE_SYSTEM_SQLITE=1)


mkdir -p $LFS_PCK_DIR/usr/lib/pkgconfig
mkdir -p $LFS_PCK_DIR/usr/bin


cd ../dist                                                          

install -v -m755 Linux*/lib/*.so              $LFS_PCK_DIR/usr/lib              
install -v -m644 Linux*/lib/{*.chk,libcrmf.a} $LFS_PCK_DIR/usr/lib              

install -v -m755 -d                           $LFS_PCK_DIR/usr/include/nss      
cp -v -RL {public,private}/nss/*              $LFS_PCK_DIR/usr/include/nss      

install -v -m755 Linux*/bin/{certutil,nss-config,pk12util} $LFS_PCK_DIR/usr/bin 

install -v -m644 Linux*/lib/pkgconfig/nss.pc  $LFS_PCK_DIR/usr/lib/pkgconfig

ln -sfv ./pkcs11/p11-kit-trust.so $LFS_PCK_DIR/usr/lib/libnssckbi.so

