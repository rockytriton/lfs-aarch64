
for f in /usr/bin/rst*.py; do
  rm -fv /usr/bin/$(basename $f .py)
done

pip3 wheel -w dist --no-build-isolation --no-deps --no-cache-dir $PWD
pip3 install --no-index --find-links=dist --no-cache-dir --no-user docutils
