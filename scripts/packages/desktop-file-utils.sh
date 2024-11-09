
mkdir build &&
cd    build &&

meson setup --prefix=/usr --buildtype=release .. &&
ninja
ninja install

install -vdm755 /usr/share/applications &&
update-desktop-database /usr/share/applications

ldconfig                             
update-mime-database /usr/share/mime 

xdg-icon-resource forceupdate || echo "no icon resource"

update-desktop-database -q
