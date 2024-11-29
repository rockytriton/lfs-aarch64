groupadd -fg 84 avahi &&
useradd -c "Avahi Daemon Owner" -d /run/avahi-daemon -u 84 \
        -g avahi -s /bin/false avahi || echo "user exists"

groupadd -fg 86 netdev || echo "group exists"

systemctl enable avahi-daemon
systemctl enable avahi-dnsconfd
