
useradd -c "Print Service User" -d /var/spool/cups -g lp -s /bin/false -u 9 lp || echo "user exists"
groupadd -g 19 lpadmin || echo "group exists"

systemctl enable cups

gtk-update-icon-cache -qtf /usr/share/icons/hicolor || echo "gtk not installed"
