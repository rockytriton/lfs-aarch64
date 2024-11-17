cargo build --release

mkdir -p $LFS_PCK_DIR/usr/bin

install -v -m755 target/release/bindgen $LFS_PCK_DIR/usr/bin
