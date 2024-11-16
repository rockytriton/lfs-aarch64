echo "Set password for root user"
passwd

systemd-machine-id-setup

systemctl preset-all

ldconfig
