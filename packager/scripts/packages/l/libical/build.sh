sed -i '/getKeywordValuesForLocale/s/NULL/""/' src/libical/icalrecur.c

mkdir _build &&
cd    _build &&

cmake -D CMAKE_INSTALL_PREFIX=/usr  \
      -D CMAKE_BUILD_TYPE=Release   \
      -D SHARED_ONLY=yes            \
      -D ICAL_BUILD_DOCS=false      \
      -D ICAL_BUILD_EXAMPLES=false  \
      -D GOBJECT_INTROSPECTION=true \
      -D ICAL_GLIB_VAPI=true        \
      ..

make
make DESTDIR=$LFS_PCK_DIR install

