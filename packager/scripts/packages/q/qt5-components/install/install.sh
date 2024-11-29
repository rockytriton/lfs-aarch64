cat >> /etc/ld.so.conf << EOF
# Begin Qt addition

/opt/qt5/lib

# End Qt addition
EOF

ldconfig
