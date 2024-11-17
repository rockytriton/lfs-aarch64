mv tests/dbusmock{,-tests}

sed -e '/accounts_service\.py/s/dbusmock/dbusmock-tests/' \
    -e 's/assertEquals/assertEqual/'                      \
    -i tests/test-libaccountsservice.py

sed -i '/^SIMULATED_SYSTEM_LOCALE/s/en_IE.UTF-8/en_HK.iso88591/' tests/test-daemon.py

mkdir __build
cd    __build
meson setup ..            \
      --prefix=/usr       \
      --buildtype=release \
      -D admin_group=adm

grep 'print_indent'     ../subprojects/mocklibc-1.0/src/netgroup.c \
     | sed 's/ {/;/' >> ../subprojects/mocklibc-1.0/src/netgroup.h &&
sed -i '1i#include <stdio.h>'                                      \
    ../subprojects/mocklibc-1.0/src/netgroup.h

ninja
DESTDIR=$LFS_PCK_DIR ninja install

mkdir -p $LFS_PCK_DIR/etc/polkit-1/rules.d/
cat > $LFS_PCK_DIR/etc/polkit-1/rules.d/40-adm.rules << "EOF"
polkit.addAdminRule(function(action, subject) {
   return ["unix-group:adm"];
   });
EOF
