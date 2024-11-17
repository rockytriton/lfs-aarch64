wget https://anduin.linuxfromscratch.org/BLFS/llvm/llvm-cmake-18.src.tar.xz -P ..
wget https://anduin.linuxfromscratch.org/BLFS/llvm/llvm-third-party-18.src.tar.xz -P ..
wget https://github.com/llvm/llvm-project/releases/download/llvmorg-18.1.7/clang-18.1.7.src.tar.xz -P ..
wget https://github.com/llvm/llvm-project/releases/download/llvmorg-18.1.7/compiler-rt-18.1.7.src.tar.xz -P ..

tar -xf ../llvm-cmake-18.src.tar.xz                                   &&
tar -xf ../llvm-third-party-18.src.tar.xz                             &&
sed '/LLVM_COMMON_CMAKE_UTILS/s@../cmake@llvm-cmake-18.src@'          \
    -i CMakeLists.txt                                                 &&
sed '/LLVM_THIRD_PARTY_DIR/s@../third-party@llvm-third-party-18.src@' \
    -i cmake/modules/HandleLLVMOptions.cmake

tar -xf ../clang-18.1.7.src.tar.xz -C tools &&
mv tools/clang-18.1.7.src tools/clang

tar -xf ../compiler-rt-18.1.7.src.tar.xz -C projects    &&
mv projects/compiler-rt-18.1.7.src projects/compiler-rt

grep -rl '#!.*python' | xargs sed -i '1s/python$/python3/'

sed 's/utility/tool/' -i utils/FileCheck/CMakeLists.txt

mkdir -v build 
cd       build 


MAKEFLAGS=-j1 CC=gcc CXX=g++                               \
cmake -D CMAKE_INSTALL_PREFIX=/usr           \
      -D CMAKE_SKIP_INSTALL_RPATH=ON         \
      -D LLVM_ENABLE_FFI=ON                  \
      -D CMAKE_BUILD_TYPE=Release            \
      -D LLVM_BUILD_LLVM_DYLIB=ON            \
      -D LLVM_LINK_LLVM_DYLIB=ON             \
      -D LLVM_ENABLE_RTTI=ON                 \
      -D LLVM_TARGETS_TO_BUILD="host;AMDGPU" \
      -D LLVM_BINUTILS_INCDIR=/usr/include   \
      -D LLVM_INCLUDE_BENCHMARKS=OFF         \
      -D CLANG_DEFAULT_PIE_ON_LINUX=ON       \
      -D CLANG_CONFIG_FILE_SYSTEM_DIR=/etc/clang \
      -W no-dev ..                  
MAKEFLAGS=-j$(nproc)

make
make DESTDIR=$LFS_PCK_DIR install

mkdir -pv $LFS_PCK_DIR/etc/clang &&
for i in clang clang++; do
  echo -fstack-protector-strong > $LFS_PCK_DIR/etc/clang/$i.cfg
done

