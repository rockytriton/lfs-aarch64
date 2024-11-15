pwconv
grpconv
useradd -D --gid 999
sed -i '/MAIL/s/yes/no/' /etc/default/useradd
