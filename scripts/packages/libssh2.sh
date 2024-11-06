wget https://www.linuxfromscratch.org/patches/blfs/12.2/libssh2-1.11.0-security_fixes-1.patch -P ..

patch -Np1 -i ../libssh2-1.11.0-security_fixes-1.patch

sed -E '/^DOCKER_TEST/,/^SSHD_TEST/s/test_(auth_keyboard_info.* |hostkey |simple)/$(NOTHING)/' \
    -i tests/Makefile.inc 
autoreconf -fi 
sed 's/ssh-dss,//' -i tests/openssh_server/sshd_config

./configure --prefix=/usr          \
            --disable-docker-tests \
            --disable-static 
            
make
make install

