mkdir -p $LFS_PCK_DIR/tmp/

pip3 wheel -w $LFS_PCK_DIR/tmp/dist --no-cache-dir --no-build-isolation --no-deps $PWD

