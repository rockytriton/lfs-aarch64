cargo build --release

mkdir -p $LFS_PCK_DIR/usr/bin/

install -Dm755 target/release/cbindgen $LFS_PCK_DIR/usr/bin/
