sed -i '/int Guess/a \
  int   j = 0;\
  char* jobs = getenv( "NINJAJOBS" );\
  if ( jobs != NULL ) j = atoi( jobs );\
  if ( j > 0 ) return j;\
' src/ninja.cc

python3 configure.py --bootstrap

mkdir -p $LFS_PCK_DIR/usr/bin/

install -vm755 ninja $LFS_PCK_DIR/usr/bin/
install -vDm644 misc/bash-completion $LFS_PCK_DIR/usr/share/bash-completion/completions/ninja
install -vDm644 misc/zsh-completion  $LFS_PCK_DIR/usr/share/zsh/site-functions/_ninja
