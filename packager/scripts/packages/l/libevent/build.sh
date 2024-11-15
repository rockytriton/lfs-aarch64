sed -i 's/python/&3/' event_rpcgen.py
./configure --prefix=/usr --disable-static 
make
make install

