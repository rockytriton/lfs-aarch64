
groupadd -fg 27 polkitd &&
useradd -c "PolicyKit Daemon Owner" -d /etc/polkit-1 -u 27 \
        -g polkitd -s /bin/false polkitd

mkdir build 
cd    build 

meson setup ..                   \
      --prefix=/usr              \
      --buildtype=release        \
      -D man=true                \
      -D session_tracking=logind \
      -D tests=true

ninja 
ninja install
