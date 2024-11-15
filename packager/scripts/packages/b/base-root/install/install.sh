pwconv
grpconv
useradd -D --gid 999 || echo "user exists"
sed -i '/MAIL/s/yes/no/' /etc/default/useradd || echo "userad edited"

