
#for f in /usr/bin/rst*.py; do
#  rm -fv /usr/bin/$(basename $f .py)
#done

mkdir -p $LFS_PCK_DIR/tmp

pip3 wheel -w $LFS_PCK_DIR/tmp/dist --no-build-isolation --no-deps --no-cache-dir $PWD

