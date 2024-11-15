mkdir build 
cd    build 

cmake -D CMAKE_BUILD_TYPE=Release -D CMAKE_INSTALL_PREFIX=$XORG_PREFIX ..

make
make install

echo "export VDPAU_DRIVER=va_gl" >> /etc/profile.d/xorg.sh
