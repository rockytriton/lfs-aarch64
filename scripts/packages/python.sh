
CXX="/usr/bin/g++"               \
./configure --prefix=/usr        \
            --enable-shared      \
            --with-system-expat  \
            --enable-optimizations 
make
make DESTDIR=$LFS_PCK_DIR install

mkdir -p $LFS_PCK_DIR/etc

cat > $LFS_PCK_DIR/etc/pip.conf << EOF
[global]
root-user-action = ignore
disable-pip-version-check = true
EOF

