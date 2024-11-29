wget https://www.linuxfromscratch.org/patches/blfs/12.2/vlc-3.0.21-taglib-1.patch -P ..
wget https://www.linuxfromscratch.org/patches/blfs/12.2/vlc-3.0.21-fedora_ffmpeg7-1.patch -P ..

patch -Np1 -i ../vlc-3.0.21-taglib-1.patch         
patch -Np1 -i ../vlc-3.0.21-fedora_ffmpeg7-1.patch

export LUAC=/usr/bin/luac5.2                   
export LUA_LIBS="$(pkg-config --libs lua52)"   
export CPPFLAGS="$(pkg-config --cflags lua52)"

BUILDCC=gcc ./configure --prefix=/usr --disable-libplacebo 

make
make docdir=/usr/share/doc/vlc-3.0.21 DESTDIR=$LFS_PCK_DIR install

