wget https://www.linuxfromscratch.org/patches/blfs/12.2/xorg-server-21.1.13-tearfree_backport-2.patch -P ..
patch -Np1 -i ../xorg-server-21.1.13-tearfree_backport-2.patch

mkdir build 
cd    build 

meson setup ..              \
      --prefix=$XORG_PREFIX \
      --localstatedir=/var  \
      -D glamor=true        \
      -D xkb_output_dir=/var/lib/xkb 
ninja

ninja install 
mkdir -pv /etc/X11/xorg.conf.d

