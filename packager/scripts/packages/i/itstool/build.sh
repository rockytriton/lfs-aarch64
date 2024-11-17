
sed -i 's/re.sub(/re.sub(r/'         itstool.in 
sed -i 's/re.compile(/re.compile(r/' itstool.in
PYTHON=/usr/bin/python3 ./configure --prefix=/usr 
make
make DESTDIR=$LFS_PCK_DIR install

