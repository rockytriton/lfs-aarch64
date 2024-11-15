pwconv
grpconv
useradd -D --gid 999
passwd
sed -i '/MAIL/s/yes/no/' /etc/default/useradd
