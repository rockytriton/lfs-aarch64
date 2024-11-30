
mkdir -p $LFS_PCK_DIR/tmp

sed -i '/calver/s/^/#/;$iversion="2024.7.2"' setup.py

pip3 wheel -w $LFS_PCK_DIR/tmp/dist --no-build-isolation --no-deps --no-cache-dir $PWD
