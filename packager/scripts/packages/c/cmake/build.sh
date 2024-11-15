
sed -i '/"lib64"/s/64//' Modules/GNUInstallDirs.cmake 

./bootstrap --prefix=/usr        \
            --system-libs        \
            --mandir=/share/man  \
            --no-system-jsoncpp  \
            --no-system-cppdap   \
            --no-system-librhash \
            --docdir=/share/doc/cmake-3.30.2
make
make install

