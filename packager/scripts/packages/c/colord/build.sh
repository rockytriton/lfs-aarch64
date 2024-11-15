wget https://www.linuxfromscratch.org/patches/blfs/12.2/colord-1.4.7-upstream_fixes-1.patch -P ..

patch -Np1 -i ../colord-1.4.7-upstream_fixes-1.patch

groupadd -g 71 colord &&
useradd -c "Color Daemon Owner" -d /var/lib/colord -u 71 \
        -g colord -s /bin/false colord

mkdir build 
cd    build 

meson setup ..                  \
      --prefix=/usr             \
      --buildtype=release       \
      -D daemon_user=colord     \
      -D vapi=true              \
      -D systemd=true           \
      -D libcolordcompat=true   \
      -D argyllcms_sensor=false \
      -D bash_completion=false  \
      -D docs=false             \
      -D man=false              
ninja

ninja install
