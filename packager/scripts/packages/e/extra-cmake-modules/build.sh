
sed -i '/"lib64"/s/64//' kde-modules/KDEInstallDirsCommon.cmake 

sed -e '/PACKAGE_INIT/i set(SAVE_PACKAGE_PREFIX_DIR "${PACKAGE_PREFIX_DIR}")' \
    -e '/^include/a set(PACKAGE_PREFIX_DIR "${SAVE_PACKAGE_PREFIX_DIR}")' \
    -i ECMConfig.cmake.in 

mkdir build 
cd    build 

cmake -D CMAKE_INSTALL_PREFIX=/usr ..
make
make DESTDIR=$LFS_PCK_DIR install

