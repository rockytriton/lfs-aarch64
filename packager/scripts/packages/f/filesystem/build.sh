#!/bin/bash
mkdir -pv $LFS_PCK_DIR/{etc,var,dev,proc,sys,run,lib64} $LFS_PCK_DIR/usr/{bin,lib,sbin}

for i in bin lib sbin; do
    ln -sv usr/$i $LFS_PCK_DIR/$i
done

ln -sfv ../lib/ld-linux-aarch64.so.1 $LFS_PCK_DIR/lib64/ld-linux-aarch64.so.1
ln -sfv ../lib/ld-linux-aarch64.so.1 $LFS_PCK_DIR/lib64/ld-lsb-aarch64.so.1

mkdir -pv $LFS_PCK_DIR/{boot,home,mnt,opt,srv}
mkdir -pv $LFS_PCK_DIR/etc/{opt,sysconfig}
mkdir -pv $LFS_PCK_DIR/lib/firmware
mkdir -pv $LFS_PCK_DIR/media/{floppy,cdrom}
mkdir -pv $LFS_PCK_DIR/usr/{,local/}{include,src}
mkdir -pv $LFS_PCK_DIR/usr/lib/locale
mkdir -pv $LFS_PCK_DIR/usr/local/{bin,lib,sbin}
mkdir -pv $LFS_PCK_DIR/usr/{,local/}share/{color,dict,doc,info,locale,man}
mkdir -pv $LFS_PCK_DIR/usr/{,local/}share/{misc,terminfo,zoneinfo,lfs}
mkdir -pv $LFS_PCK_DIR/usr/{,local/}share/man/man{1..8}
mkdir -pv $LFS_PCK_DIR/var/{cache,local,log,mail,opt,spool}
mkdir -pv $LFS_PCK_DIR/var/lib/{color,misc,locate}

mkdir -pv $LFS_PCK_DIR/var/lib/hwclock

ln -sfv /run $LFS_PCK_DIR/var/run
ln -sfv /run/lock $LFS_PCK_DIR/var/lock

install -dv -m 0750 $LFS_PCK_DIR/root
install -dv -m 1777 /tmp $LFS_PCK_DIR/var/tmp

ln -sv /proc/self/mounts $LFS_PCK_DIR/etc/mtab || echo "mtab exists"

cat > $LFS_PCK_DIR/etc/hosts << EOF
127.0.0.1  localhost 
::1        localhost
EOF

cat > $LFS_PCK_DIR/etc/passwd << "EOF"
root:x:0:0:root:/root:/bin/bash
bin:x:1:1:bin:/dev/null:/usr/bin/false
daemon:x:6:6:Daemon User:/dev/null:/usr/bin/false
messagebus:x:18:18:D-Bus Message Daemon User:/run/dbus:/usr/bin/false
systemd-journal-gateway:x:73:73:systemd Journal Gateway:/:/usr/bin/false
systemd-journal-remote:x:74:74:systemd Journal Remote:/:/usr/bin/false
systemd-journal-upload:x:75:75:systemd Journal Upload:/:/usr/bin/false
systemd-network:x:76:76:systemd Network Management:/:/usr/bin/false
systemd-resolve:x:77:77:systemd Resolver:/:/usr/bin/false
systemd-timesync:x:78:78:systemd Time Synchronization:/:/usr/bin/false
systemd-coredump:x:79:79:systemd Core Dumper:/:/usr/bin/false
uuidd:x:80:80:UUID Generation Daemon User:/dev/null:/usr/bin/false
systemd-oom:x:81:81:systemd Out Of Memory Daemon:/:/usr/bin/false
nobody:x:65534:65534:Unprivileged User:/dev/null:/usr/bin/false
EOF

cat > $LFS_PCK_DIR/etc/group << "EOF"
root:x:0:
bin:x:1:daemon
sys:x:2:
kmem:x:3:
tape:x:4:
tty:x:5:
daemon:x:6:
floppy:x:7:
disk:x:8:
lp:x:9:
dialout:x:10:
audio:x:11:
video:x:12:
utmp:x:13:
cdrom:x:15:
adm:x:16:
messagebus:x:18:
systemd-journal:x:23:
input:x:24:
mail:x:34:
kvm:x:61:
systemd-journal-gateway:x:73:
systemd-journal-remote:x:74:
systemd-journal-upload:x:75:
systemd-network:x:76:
systemd-resolve:x:77:
systemd-timesync:x:78:
systemd-coredump:x:79:
uuidd:x:80:
systemd-oom:x:81:
wheel:x:97:
users:x:999:
nogroup:x:65534:
EOF

#localedef -i C -f UTF-8 C.UTF-8

touch $LFS_PCK_DIR/var/log/{btmp,lastlog,faillog,wtmp}
chgrp -v 13 $LFS_PCK_DIR/var/log/lastlog
chmod -v 664  $LFS_PCK_DIR/var/log/lastlog
chmod -v 600  $LFS_PCK_DIR/var/log/btmp

