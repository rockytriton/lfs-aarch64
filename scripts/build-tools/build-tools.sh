set -e 

source ~/.bashrc

export BUILD_SCRIPT_DIR=${LFS:?}/usr/share/lfs/setup/build-tools

echo "FIRST: $LFS_TGT"

. ./utils.sh

build_tool "binutils_p1" "binutils-2.43.1.tar.xz"
build_tool "gcc_p1" "gcc-14.2.0.tar.xz"
build_tool "linux_headers" "linux-6.10.5.tar.xz"
build_tool "tool_glibc_p1" "glibc-2.40.tar.xz"
build_tool "libstdcpp" "gcc-14.2.0.tar.xz"
build_tool "cross_m4" "m4-1.4.19.tar.xz"
build_tool "cross_ncurses" "ncurses-6.5.tar.gz"
build_tool "cross_bash" "bash-5.2.32.tar.gz"
build_tool "cross_coreutils" "coreutils-9.5.tar.xz"
build_tool "cross_diff" "diffutils-3.10.tar.xz"
build_tool "cross_file" "file-5.45.tar.gz"
build_tool "cross_find" "findutils-4.10.0.tar.xz"
build_tool "cross_gawk" "gawk-5.3.0.tar.xz"
build_tool "cross_grep" "grep-3.11.tar.xz"
build_tool "cross_gzip" "gzip-1.13.tar.xz"
build_tool "cross_make" "make-4.4.1.tar.gz"
build_tool "cross_patch" "patch-2.7.6.tar.xz"
build_tool "cross_sed" "sed-4.9.tar.xz"
build_tool "cross_tar" "tar-1.35.tar.xz"
build_tool "cross_xz" "xz-5.6.2.tar.xz"
build_tool "binutils_p2" "binutils-2.43.1.tar.xz"
build_tool "gcc_p2" "gcc-14.2.0.tar.xz"

