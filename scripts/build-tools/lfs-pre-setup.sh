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

