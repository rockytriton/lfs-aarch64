set -e 

echo "Starting LFS Setup in ${LFS:?}"
mkdir -pv $LFS/sources
chmod -v a+wt $LFS/sources

cd $LFS/sources
wget https://linuxfromscratch.org/lfs/downloads/stable-systemd/wget-list

wget --input-file=wget-list --continue --directory-prefix=$LFS/sources

wget https://linuxfromscratch.org/lfs/downloads/stable-systemd/md5sums

pushd $LFS/sources
  md5sum -c md5sums
popd

#these are needed for BLFS before you can call wget...
wget    https://ftp.gnu.org/gnu/libidn/libidn2-2.3.7.tar.gz
wget    https://ftp.gnu.org/gnu/libunistring/libunistring-1.2.tar.xz
wget    https://github.com/rockdaboot/libpsl/releases/download/0.21.5/libpsl-0.21.5.tar.gz
wget    https://ftp.gnu.org/gnu/libtasn1/libtasn1-4.19.0.tar.gz
wget    https://github.com/p11-glue/p11-kit/releases/download/0.25.5/p11-kit-0.25.5.tar.xz
wget    https://github.com/lfs-book/make-ca/archive/v1.14/make-ca-1.14.tar.gz
wget    https://ftp.gnu.org/gnu/wget/wget-1.24.5.tar.gz
wget    https://sqlite.org/2024/sqlite-autoconf-3460100.tar.gz

chown root:root $LFS/sources/*

groupadd lfs &&
useradd -s /bin/bash -g lfs -m -k /dev/null lfs &&
passwd lfs

mkdir -pv $LFS/{etc,var,lib64} $LFS/usr/{bin,lib,sbin}

for i in bin lib sbin; do
  ln -sv usr/$i $LFS/$i
done

mkdir -pv $LFS/tools

chown -v lfs $LFS/{usr{,/*},lib,var,etc,bin,sbin,tools,lib64}

mkdir -pv $LFS/usr/share/lfs/

cat > /home/lfs/.bash_profile << "EOF"
exec env -i HOME=$HOME TERM=$TERM PS1='\u:\w\$ ' /bin/bash
EOF

cat > /home/lfs/.bashrc << "EOF"
set +h
umask 022
LFS=/mnt/lfs
LC_ALL=POSIX
LFS_TGT=$(uname -m)-lfs-linux-gnu
PATH=/usr/bin
if [ ! -L /bin ]; then PATH=/bin:$PATH; fi
PATH=$LFS/tools/bin:$PATH
CONFIG_SITE=$LFS/usr/share/config.site
export LFS LC_ALL LFS_TGT PATH CONFIG_SITE
export MAKEFLAGS=-j$(nproc)
EOF

echo "pre-setup" > $LFS/usr/share/lfs/installed

mkdir -p $LFS/usr/share/lfs/setup
cp -r $BUILD_SCRIPT_DIR $LFS/usr/share/lfs/setup

chown -vR lfs $LFS/usr/share

