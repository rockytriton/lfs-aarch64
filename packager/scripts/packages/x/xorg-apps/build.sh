cat > app-7.md5 << "EOF"
30f898d71a7d8e817302970f1976198c  iceauth-1.0.10.tar.xz
7dcf5f702781bdd4aaff02e963a56270  mkfontscale-1.2.3.tar.xz
05423bb42a006a6eb2c36ba10393de23  sessreg-1.1.3.tar.xz
1d61c9f4a3d1486eff575bf233e5776c  setxkbmap-1.3.4.tar.xz
9f7a4305f0e79d5a46c3c7d02df9437d  smproxy-1.0.7.tar.xz
e96b56756990c56c24d2d02c2964456b  x11perf-1.6.1.tar.bz2
595c941d9aff6f6d6e038c4e42dcff58  xauth-1.1.3.tar.xz
82a90e2feaeab5c5e7610420930cc0f4  xcmsdb-1.0.6.tar.xz
89e81a1c31e4a1fbd0e431425cd733d7  xcursorgen-1.0.8.tar.xz
933e6d65f96c890f8e96a9f21094f0de  xdpyinfo-1.3.4.tar.xz
34aff1f93fa54d6a64cbe4fee079e077  xdriinfo-1.0.7.tar.xz
f29d1544f8dd126a1b85e2f7f728672d  xev-1.2.6.tar.xz
41afaa5a68cdd0de7e7ece4805a37f11  xgamma-1.0.7.tar.xz
48ac13856838d34f2e7fca8cdc1f1699  xhost-1.0.9.tar.xz
8e4d14823b7cbefe1581c398c6ab0035  xinput-1.6.4.tar.xz
83d711948de9ccac550d2f4af50e94c3  xkbcomp-1.4.7.tar.xz
05ce1abd8533a400572784b1186a44d0  xkbevd-1.1.5.tar.xz
07483ddfe1d83c197df792650583ff20  xkbutils-1.0.6.tar.xz
f62b99839249ce9a7a8bb71a5bab6f9d  xkill-1.0.6.tar.xz
da5b7a39702841281e1d86b7349a03ba  xlsatoms-1.1.4.tar.xz
ab4b3c47e848ba8c3e47c021230ab23a  xlsclients-1.1.5.tar.xz
ba2dd3db3361e374fefe2b1c797c46eb  xmessage-1.0.7.tar.xz
0d66e07595ea083871048c4b805d8b13  xmodmap-1.0.11.tar.xz
ab6c9d17eb1940afcfb80a72319270ae  xpr-1.2.0.tar.xz
d050642a667b518cb3429273a59fa36d  xprop-1.2.7.tar.xz
f822a8d5f233e609d27cc22d42a177cb  xrandr-1.5.2.tar.xz
c8629d5a0bc878d10ac49e1b290bf453  xrdb-1.2.2.tar.xz
55003733ef417db8fafce588ca74d584  xrefresh-1.1.0.tar.xz
18ff5cdff59015722431d568a5c0bad2  xset-1.2.5.tar.xz
fa9a24fe5b1725c52a4566a62dd0a50d  xsetroot-1.1.3.tar.xz
d698862e9cad153c5fefca6eee964685  xvinfo-1.1.5.tar.xz
b0081fb92ae56510958024242ed1bc23  xwd-1.0.9.tar.xz
c91201bc1eb5e7b38933be8d0f7f16a8  xwininfo-1.1.6.tar.xz
5ff5dc120e8e927dc3c331c7fee33fc3  xwud-1.0.6.tar.xz
EOF

mkdir app &&
cd app &&
grep -v '^#' ../app-7.md5 | awk '{print $2}' | wget -i- -c \
    -B https://www.x.org/pub/individual/app/ &&
md5sum -c ../app-7.md5

for package in $(grep -v '^#' ../app-7.md5 | awk '{print $2}')
do
  packagedir=${package%.tar.?z*}
  tar -xf $package
  pushd $packagedir
     ./configure $XORG_CONFIG
     make
     make DESTDIR=$LFS_PCK_DIR install
  popd
  rm -rf $packagedir
done

rm -f $LFS_PCK_DIR/$XORG_PREFIX/bin/xkeystone
