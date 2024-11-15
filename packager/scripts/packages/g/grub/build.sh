
echo depends bli part_gpt > grub-core/extra_deps.lst

./configure --prefix=/usr          \
            --sysconfdir=/etc      \
            --disable-efiemu       \
            --disable-werror
make
make DESTDIR=$LFS_PCK_DIR install

mkdir -p $LFS_PCK_DIR/usr/share/bash-completion/completions
mv -v $LFS_PCK_DIR/etc/bash_completion.d/grub $LFS_PCK_DIR/usr/share/bash-completion/completions
