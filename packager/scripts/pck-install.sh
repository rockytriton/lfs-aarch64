#!/bin/bash
set -e

package_pck=$1
package_ver=$2

cd /
rm -rf install

tar -xhf ${LFS_BIN_DIR:?}/$package_pck-$package_ver-pck.txz

if test -d /install; then
    echo "Running installer..."
    cd /install
    bash -e install.sh
    cd /
    rm -rf install
fi

echo "Installed package $package_pck"
