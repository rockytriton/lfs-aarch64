wget https://www.linuxfromscratch.org/patches/blfs/12.2/ffmpeg-7.0.2-chromium_method-1.patch -P ..

patch -Np1 -i ../ffmpeg-7.0.2-chromium_method-1.patch

./configure --prefix=/usr        \
            --enable-gpl         \
            --enable-version3    \
            --enable-nonfree     \
            --disable-static     \
            --enable-shared      \
            --disable-debug      \
            --enable-libaom      \
            --enable-libass      \
            --enable-libfdk-aac  \
            --enable-libfreetype \
            --enable-libmp3lame  \
            --enable-libopus     \
            --enable-libvorbis   \
            --enable-libvpx      \
            --enable-libx264     \
            --enable-libx265     \
            --enable-openssl     \
            --ignore-tests=enhanced-flv-av1 \
            --docdir=/usr/share/doc/ffmpeg-7.0.2

make

gcc tools/qt-faststart.c -o tools/qt-faststart


make DESTDIR=$LFS_PCK_DIR install

mkdir -p $LFS_PCK_DIR/usr/bin
mkdir -p $LFS_PCK_DIR/usr/share/doc

install -v -m755    tools/qt-faststart $LFS_PCK_DIR/usr/bin &&
install -v -m755 -d           $LFS_PCK_DIR/usr/share/doc/ffmpeg-7.0.2 &&
install -v -m644    doc/*.txt $LFS_PCK_DIR/usr/share/doc/ffmpeg-7.0.2

