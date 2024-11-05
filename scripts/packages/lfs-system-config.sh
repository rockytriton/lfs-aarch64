
systemctl disable systemd-networkd-wait-online

ln -s /dev/null /etc/systemd/network/99-default.link

cat > /etc/systemd/network/10-eth-static.network << "EOF"
[Match]
Name=<network-device-name>

[Network]
Address=192.168.86.202/24
Gateway=192.168.86.1
DNS=8.8.8.8
Domains=lfs.local
EOF

systemctl disable systemd-resolved

cat > /etc/resolv.conf << "EOF"
# Begin /etc/resolv.conf

domain lfs.local
nameserver 8.8.8.8

# End /etc/resolv.conf
EOF

echo "lfs" > /etc/hostname

cat > /etc/adjtime << "EOF"
0.0 0 0.0
0
LOCAL
EOF

systemctl disable systemd-timesyncd

cat > /etc/locale.conf << "EOF"
LANG=en_US.UTF-8
EOF

cat > /etc/profile << "EOF"
# Begin /etc/profile

for i in $(locale); do
  unset ${i%=*}
done

if [[ "$TERM" = linux ]]; then
  export LANG=C.UTF-8
else
  source /etc/locale.conf

  for i in $(locale); do
    key=${i%=*}
    if [[ -v $key ]]; then
      export $key
    fi
  done
fi

# End /etc/profile
EOF

cat > /etc/inputrc << "EOF"
# Begin /etc/inputrc
# Modified by Chris Lynn <roryo@roryo.dynup.net>

# Allow the command prompt to wrap to the next line
set horizontal-scroll-mode Off

# Enable 8-bit input
set meta-flag On
set input-meta On

# Turns off 8th bit stripping
set convert-meta Off

# Keep the 8th bit for display
set output-meta On

# none, visible or audible
set bell-style none

# All of the following map the escape sequence of the value
# contained in the 1st argument to the readline specific functions
"\eOd": backward-word
"\eOc": forward-word

# for linux console
"\e[1~": beginning-of-line
"\e[4~": end-of-line
"\e[5~": beginning-of-history
"\e[6~": end-of-history
"\e[3~": delete-char
"\e[2~": quoted-insert

# for xterm
"\eOH": beginning-of-line
"\eOF": end-of-line

# for Konsole
"\e[H": beginning-of-line
"\e[F": end-of-line

# End /etc/inputrc
EOF

cat > /etc/shells << "EOF"
# Begin /etc/shells

/bin/sh
/bin/bash

# End /etc/shells
EOF

mkdir -pv /etc/systemd/system/getty@tty1.service.d

cat > /etc/systemd/system/getty@tty1.service.d/noclear.conf << EOF
[Service]
TTYVTDisallocate=no
EOF

mnt=$(lsblk | grep -E " /$" | awk '{print $1}' | awk -F- '{print $2}')

cat > /etc/fstab << "EOF"
# Begin /etc/fstab

# file system  mount-point  type     options             dump  fsck
#                                                              order

/dev/$mnt      /           ext4    defaults            1     1
#/dev/<yyy>     swap         swap     pri=1               0     0

# End /etc/fstab
EOF

echo 12.2-systemd > /etc/lfs-release

cat > /etc/lsb-release << "EOF"
DISTRIB_ID="Linux From Scratch"
DISTRIB_RELEASE="12.2-systemd"
DISTRIB_CODENAME="LFS aarch64"
DISTRIB_DESCRIPTION="Linux From Scratch"
EOF

cat > /etc/os-release << "EOF"
NAME="Linux From Scratch"
VERSION="12.2-systemd"
ID=lfs
PRETTY_NAME="Linux From Scratch 12.2-systemd"
VERSION_CODENAME="LFS aarch64"
HOME_URL="https://www.linuxfromscratch.org/lfs/"
EOF

