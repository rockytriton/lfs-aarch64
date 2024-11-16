mkdir $LFS_PCK_DIR/tmp
pip3 wheel -w $LFS_PCK_DIR/tmp/dist --no-cache-dir --no-build-isolation --no-deps $PWD

install -vDm644 data/shell-completions/bash/meson $LFS_PCK_DIR/usr/share/bash-completion/completions/meson
install -vDm644 data/shell-completions/zsh/_meson $LFS_PCK_DIR/usr/share/zsh/site-functions/_meson

