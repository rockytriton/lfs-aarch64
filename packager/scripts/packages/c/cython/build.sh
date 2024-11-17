mkdir $LFS_PCK_DIR/tmp/

pip3 wheel -w $LFS_PCK_DIR/tmp/dist --no-build-isolation --no-deps --no-cache-dir $PWD

