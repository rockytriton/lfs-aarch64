cat > lib-7.md5 << "EOF"
12344cd74a1eb25436ca6e6a2cf93097  xtrans-1.5.0.tar.xz
5b8fa54e0ef94136b56f887a5e6cf6c9  libX11-1.8.10.tar.xz
e59476db179e48c1fb4487c12d0105d1  libXext-1.3.6.tar.xz
c5cc0942ed39c49b8fcd47a427bd4305  libFS-1.0.10.tar.xz
b444a0e4c2163d1bbc7b046c3653eb8d  libICE-1.1.1.tar.xz
ffa434ed96ccae45533b3d653300730e  libSM-1.2.4.tar.xz
e613751d38e13aa0d0fd8e0149cec057  libXScrnSaver-1.2.4.tar.xz
4ea21d3b5a36d93a2177d9abed2e54d4  libXt-1.3.0.tar.xz
85edefb7deaad4590a03fccba517669f  libXmu-1.2.1.tar.xz
05b5667aadd476d77e9b5ba1a1de213e  libXpm-3.5.17.tar.xz
2a9793533224f92ddad256492265dd82  libXaw-1.0.16.tar.xz
65b9ba1e9ff3d16c4fa72915d4bb585a  libXfixes-6.0.1.tar.xz
af0a5f0abb5b55f8411cd738cf0e5259  libXcomposite-0.4.6.tar.xz
ebf7fb3241ec03e8a3b2af72f03b4631  libXrender-0.9.11.tar.xz
bf3a43ad8cb91a258b48f19c83af8790  libXcursor-1.2.2.tar.xz
ca55d29fa0a8b5c4a89f609a7952ebf8  libXdamage-1.1.6.tar.xz
8816cc44d06ebe42e85950b368185826  libfontenc-1.1.8.tar.xz
66e03e3405d923dfaf319d6f2b47e3da  libXfont2-2.0.7.tar.xz
cea0a3304e47a841c90fbeeeb55329ee  libXft-2.3.8.tar.xz
89ac74ad6829c08d5c8ae8f48d363b06  libXi-1.8.1.tar.xz
228c877558c265d2f63c56a03f7d3f21  libXinerama-1.1.5.tar.xz
24e0b72abe16efce9bf10579beaffc27  libXrandr-1.5.4.tar.xz
66c9e9e01b0b53052bb1d02ebf8d7040  libXres-1.2.2.tar.xz
b62dc44d8e63a67bb10230d54c44dcb7  libXtst-1.2.5.tar.xz
70bfdd14ca1a563c218794413f0c1f42  libXv-1.0.12.tar.xz
a90a5f01102dc445c7decbbd9ef77608  libXvMC-1.0.14.tar.xz
74d1acf93b83abeb0954824da0ec400b  libXxf86dga-1.1.6.tar.xz
5b913dac587f2de17a02e17f9a44a75f  libXxf86vm-1.1.5.tar.xz
57c7efbeceedefde006123a77a7bc825  libpciaccess-0.18.1.tar.xz
229708c15c9937b6e5131d0413474139  libxkbfile-1.1.3.tar.xz
faa74f7483074ce7d4349e6bdc237497  libxshmfence-1.3.2.tar.xz
bdd3ec17c6181fd7b26f6775886c730d  libXpresent-1.0.1.tar.xz
EOF

mkdir lib &&
cd lib &&
grep -v '^#' ../lib-7.md5 | awk '{print $2}' | wget -i- -c \
    -B https://www.x.org/pub/individual/lib/ &&
md5sum -c ../lib-7.md5

for package in $(grep -v '^#' ../lib-7.md5 | awk '{print $2}')
do
  packagedir=${package%.tar.?z*}
  echo "Building $packagedir"

  tar -xf $package
  pushd $packagedir
  docdir="--docdir=$XORG_PREFIX/share/doc/$packagedir"
  
  case $packagedir in
    libXfont2-[0-9]* )
      ./configure $XORG_CONFIG $docdir --disable-devel-docs
    ;;

    libXt-[0-9]* )
      ./configure $XORG_CONFIG $docdir \
                  --with-appdefaultdir=/etc/X11/app-defaults
    ;;

    libXpm-[0-9]* )
      ./configure $XORG_CONFIG $docdir --disable-open-zfile
    ;;
  
    libpciaccess* )
      mkdir build
      cd    build
        meson setup --prefix=$XORG_PREFIX --buildtype=release ..
        ninja
        ninja install
      popd     # $packagedir
      continue # for loop
    ;;

    * )
      ./configure $XORG_CONFIG $docdir
    ;;
  esac

  make
  make install
  popd
  rm -rf $packagedir
  /sbin/ldconfig
done
