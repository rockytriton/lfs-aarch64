sed -i '/getKeywordValuesForLocale/s/NULL/""/' src/libical/icalrecur.c

mkdir build 
cd    build 

cmake -D CMAKE_INSTALL_PREFIX=/usr  \
      -D CMAKE_BUILD_TYPE=Release   \
      -D SHARED_ONLY=yes            \
      -D ICAL_BUILD_DOCS=false      \
      -D ICAL_BUILD_EXAMPLES=false  \
      -D GOBJECT_INTROSPECTION=true \
      -D ICAL_GLIB_VAPI=true        \
      .. 
make
make install

