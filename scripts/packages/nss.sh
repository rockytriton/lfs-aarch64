wget https://www.linuxfromscratch.org/patches/blfs/12.2/nss-3.103-standalone-1.patch -P ..

patch -Np1 -i ../nss-3.103-standalone-1.patch 

cd nss 

make BUILD_OPT=1                      \
  NSPR_INCLUDE_DIR=/usr/include/nspr  \
  USE_SYSTEM_ZLIB=1                   \
  ZLIB_LIBS=-lz                       \
  NSS_ENABLE_WERROR=0                 \
  USE_64=1 \
  NSS_USE_SYSTEM_SQLITE=1

cd ../dist                                                          

install -v -m755 Linux*/lib/*.so              /usr/lib              
install -v -m644 Linux*/lib/{*.chk,libcrmf.a} /usr/lib              

install -v -m755 -d                           /usr/include/nss      
cp -v -RL {public,private}/nss/*              /usr/include/nss      

install -v -m755 Linux*/bin/{certutil,nss-config,pk12util} /usr/bin 

install -v -m644 Linux*/lib/pkgconfig/nss.pc  /usr/lib/pkgconfig
ln -sfv ./pkcs11/p11-kit-trust.so /usr/lib/libnssckbi.so
