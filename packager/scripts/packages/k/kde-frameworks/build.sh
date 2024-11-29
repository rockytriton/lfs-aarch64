url=https://download.kde.org/stable/frameworks/6.5/
wget -r -nH -nd -A '*.xz' -np $url

cat > frameworks-6.5.0.md5 << "EOF"
9f93da02571dc32c0c39db4911546731  attica-6.5.0.tar.xz
#bceea430e534852558b54f4bd3354474  extra-cmake-modules-6.5.0.tar.xz
#05e0a1b09e3abb81068e4614f7e9b4a5  kapidox-6.5.0.tar.xz
77c9c2100e36a44714c665644a4773c3  karchive-6.5.0.tar.xz
facb9708090a0eb54a3f6c22f2baa86e  kcodecs-6.5.0.tar.xz
698ab95acdc713571f917bb70073e2df  kconfig-6.5.0.tar.xz
ab4868788299d29e9016bc57be64b6e6  kcoreaddons-6.5.0.tar.xz
763aa4bc47b19a4b7471eca628be7e8a  kdbusaddons-6.5.0.tar.xz
a30dc9bc14f6f2c2316a252e1f6ee7b7  kdnssd-6.5.0.tar.xz
e23c576829b3a35631b729a3826eb381  kguiaddons-6.5.0.tar.xz
54d5c5dc203772577b6e01e7704f23d2  ki18n-6.5.0.tar.xz
fb7a5aec22e99bc69d4c4d50ee418dd5  kidletime-6.5.0.tar.xz
6751e1b3b08bfd34b7f791f90419796a  kimageformats-6.5.0.tar.xz
5fd3404f7197097a23d2db7cd776432e  kitemmodels-6.5.0.tar.xz
6b6f3cd08284cef4c7bed3d31c5735a4  kitemviews-6.5.0.tar.xz
0a33080b08df165501d065eb0ccbb4d6  kplotting-6.5.0.tar.xz
ff9f14101fe8bb6686cc3bc8e1d352f7  kwidgetsaddons-6.5.0.tar.xz
5631073e18780513a3005159dd73e290  kwindowsystem-6.5.0.tar.xz
579eea31abc156e82cc4b746d212f4d2  networkmanager-qt-6.5.0.tar.xz
712a3c59785bd0de4862cce34de58e4c  solid-6.5.0.tar.xz
afe1cc49342b0b78993172c8a9e1dc20  sonnet-6.5.0.tar.xz
b9df82b41676d91ea0371bd61e6082d0  threadweaver-6.5.0.tar.xz
952c44490af601ebd58cae56a5c38481  kauth-6.5.0.tar.xz
1db39b1e20b31bbff7d2079e9856b067  kcompletion-6.5.0.tar.xz
104bcce4ba8d7d5936ffb4be66762ff0  kcrash-6.5.0.tar.xz
43dfbda305f57ae0cda57091202d034a  kdoctools-6.5.0.tar.xz
b39dc81ffbea67c69a1e9e41e6c4acb5  kpty-6.5.0.tar.xz
f721e794c896d48f4143bf8054f471d0  kunitconversion-6.5.0.tar.xz
5f37c1b7b58d13109f9d77f2f47610a0  kcolorscheme-6.5.0.tar.xz
3da8c7755a7207ce332775f7bea879a9  kconfigwidgets-6.5.0.tar.xz
36af7db35be0bdae9d9ae10d67ea1b1f  kservice-6.5.0.tar.xz
51be7e11487b2d3ef3a35bdd2d3eec74  kglobalaccel-6.5.0.tar.xz
1bc8471d498ad3de7c144bcac545ab29  kpackage-6.5.0.tar.xz
c12d163df68d8aaee566618c2b886fe0  kdesu-6.5.0.tar.xz
a94b4e76eff97c0e2fe461e10535cf11  kiconthemes-6.5.0.tar.xz
f75c675a77172fd1cb8eaee62086fd93  knotifications-6.5.0.tar.xz
878a3dc9bb42497d6c6b3f9744372635  kjobwidgets-6.5.0.tar.xz
ea43454373673b7dfdc928609b80fbf1  ktextwidgets-6.5.0.tar.xz
7aef61c37386c5750f83a438fc140453  kxmlgui-6.5.0.tar.xz
11f331d02cd2f542cfa5be32f3c780dd  kbookmarks-6.5.0.tar.xz
fe89e3850dfe0200c3ee04e0bcf0ea86  kwallet-6.5.0.tar.xz
dadc7cc6e488d1db9b8dc482e89f07a7  kded-6.5.0.tar.xz
0f2bd915931d6501c212ff3c84433126  kio-6.5.0.tar.xz
7ef47616f65781126b29f3ff7c6637d4  kdeclarative-6.5.0.tar.xz
3478698203e69dc14ca9a8fe58b6263c  kcmutils-6.5.0.tar.xz
82ff71c1903a2d205b873e0b04715839  kirigami-6.5.0.tar.xz
39559a047c8da6aba78ba1d619353808  syndication-6.5.0.tar.xz
a6d662cf3920c575bb2fb7541c33f691  knewstuff-6.5.0.tar.xz
cb414562458340f793878c5a2b328af8  frameworkintegration-6.5.0.tar.xz
bad702d8866893c19339eab1b65c9c24  kparts-6.5.0.tar.xz
16874e76c5058e1943d04bc3bf512f03  syntax-highlighting-6.5.0.tar.xz
fbe2608ded4b47a1e7974c92d458596a  ktexteditor-6.5.0.tar.xz
7dc07ea6306795a866e4ef62e03b54da  modemmanager-qt-6.5.0.tar.xz
ca118c3fa1d01c5e98290475a4ef341d  kcontacts-6.5.0.tar.xz
ab5907924e9e35d8f328a66a5fa241ad  kpeople-6.5.0.tar.xz
124cf04998f0399a300baa585a01db6b  bluez-qt-6.5.0.tar.xz
f5d8507325dce3768b77e2565f3e70d7  kfilemetadata-6.5.0.tar.xz
00951e5fd64e184f5e1d4bc3e71f28a2  baloo-6.5.0.tar.xz
#25c0a753edc62593ecca9f56a34f7ef1  breeze-icons-6.5.0.tar.xz
940fe29e162175c932475ed20f241979  krunner-6.5.0.tar.xz
4598c42a8a4e1a93457cb2aebd392bb2  prison-6.5.0.tar.xz
c2eb5204f9f7b43798566666b06fa3ae  qqc2-desktop-style-6.5.0.tar.xz
612f5190aebd9d4c89122113fd97e73e  kholidays-6.5.0.tar.xz
9c92e566404c25c2bd142c8c5937441f  purpose-6.5.0.tar.xz
5bf4fa5abc19addec2ab47440c0b660e  kcalendarcore-6.5.0.tar.xz
2f3150f1162013f6c089dd9c48358a58  kquickcharts-6.5.0.tar.xz
9e3db7659cfe0735461d64bb959a115f  knotifyconfig-6.5.0.tar.xz
780193271545a8f7add8a171effcb36c  kdav-6.5.0.tar.xz
78b6317709ad47539b4728b22618379f  kstatusnotifieritem-6.5.0.tar.xz
7bb7d7f6ff6a4d41e81389dba5982fac  ksvg-6.5.0.tar.xz
f24694fc1e66236182cf41f1f8a789e2  ktexttemplate-6.5.0.tar.xz
52e318daedfd8b855e0554f66041535a  kuserfeedback-6.5.0.tar.xz
EOF

while read -r line; do

    # Get the file name, ignoring comments and blank lines
    if $(echo $line | grep -E -q '^ *$|^#' ); then continue; fi
    file=$(echo $line | cut -d" " -f2)

    pkg=$(echo $file|sed 's|^.*/||')          # Remove directory
    packagedir=$(echo $pkg|sed 's|\.tar.*||') # Package directory

    name=$(echo $pkg|sed 's|-6.*$||') # Isolate package name

    tar -xf $file
    pushd $packagedir

      mkdir build
      cd    build

      cmake -D CMAKE_INSTALL_PREFIX=$KF6_PREFIX \
            -D CMAKE_INSTALL_LIBEXECDIR=libexec \
            -D CMAKE_PREFIX_PATH=$QT6DIR        \
            -D CMAKE_SKIP_INSTALL_RPATH=ON      \
            -D CMAKE_BUILD_TYPE=Release         \
            -D BUILD_TESTING=OFF                \
            -W no-dev ..
      make
      make DESTDIR=$LFS_PCK_DIR install
    popd

  rm -rf $packagedir
  /sbin/ldconfig

done < frameworks-6.5.0.md5
