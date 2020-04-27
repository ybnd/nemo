# copied from https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=nemo-git

# Maintainer: Bernhard Landauer <oberon@manjaro.org>
# Maintainer: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Alexandre Filgueira <alexfilgueira@cinnarch.com>
# Contributor: Ner0

pkgname=nemo-ybnd-personal
pkgver=4.2.1.r9.g0371d6e
pkgrel=1
pkgdesc="Cinnamon file manager, git-version"
arch=('i686' 'x86_64')
url="https://github.com/ybnd/nemo"  	# changed to own fork
_branch='personal'						# changed to personal branch
license=('GPL')
depends=('cinnamon-desktop'
    'dconf'
    'exempi'
    'gvfs'
    'libexif'
    'libnotify'
    'libxml2'
    'python'
    'xapps')
makedepends=('git'
    'gobject-introspection'
    'intltool'
    'meson')
optdepends=('cinnamon-translations: i18n'
    'ffmpegthumbnailer: support for video thumbnails')
conflicts=('nemo')
provides=('nemo')
options=('!emptydirs')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd nemo
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd nemo
    # Rename 'Files' app name to avoid having the same as nautilus
    sed -i '/^\[Desktop Entry/,/^\[Desktop Action/ s/^Name\(.*\)=.*/Name\1=Nemo/' \
      data/nemo.desktop.in
}

build() {
    mkdir -p $srcdir/nemo/build
    cd $srcdir/nemo/build
    meson --prefix=/usr \
          --libexecdir=lib/${pkgname} \
          --buildtype=plain \
          ..
    ninja
}

package() {
    cd $srcdir/nemo/build
    DESTDIR="${pkgdir}" ninja install
}

