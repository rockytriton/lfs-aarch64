
sed -e '/lxqt_app_translation_loader/a set(CMAKE_EXECUTABLE_ENABLE_EXPORTS TRUE)' \
    -i panel/CMakeLists.txt

mkdir build 
cd    build 

cmake -D CMAKE_INSTALL_PREFIX=/usr \
      -D CMAKE_BUILD_TYPE=Release  \
      ..   
make
make install

