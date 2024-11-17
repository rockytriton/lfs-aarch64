update-desktop-database /usr/share/applications

ldconfig                             
update-mime-database /usr/share/mime 

xdg-icon-resource forceupdate || echo "no icon resource"

update-desktop-database -q
