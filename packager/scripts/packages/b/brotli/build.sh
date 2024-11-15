mkdir build &&
cd    build &&

cmake -D CMAKE_INSTALL_PREFIX=/usr \
      -D CMAKE_BUILD_TYPE=Release  \
      .. 
make
make install

cd .. &&
sed "/c\/.*\.[ch]'/d;\
     /include_dirs=\[/\
     i libraries=['brotlicommon','brotlidec','brotlienc']," \
    -i setup.py &&
pip3 wheel -w dist --no-build-isolation --no-deps --no-cache-dir $PWD

pip3 install --no-index --find-links=dist --no-cache-dir --no-user Brotli
