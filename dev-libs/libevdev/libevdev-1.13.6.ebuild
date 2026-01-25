# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit autotools

DESCRIPTION="Handler library for evdev events"
HOMEPAGE="https://www.freedesktop.org/wiki/Software/libevdev https://gitlab.freedesktop.org/libevdev/libevdev"
SRC_URI="https://gitlab.freedesktop.org/libevdev/libevdev/-/archive/libevdev-1.13.6/libevdev-libevdev-1.13.6.tar.bz2 -> libevdev-1.13.6.tar.bz2"
LICENSE="MIT"
SLOT="0"
KEYWORDS="*"
IUSE="static-libs"
BDEPEND="virtual/pkgconfig
	
"
S="${WORKDIR}/libevdev-libevdev-1.13.6"
src_prepare() {
	eautoreconf || die
	default
}
src_configure() {
	ECONF_SOURCE="${S}" econf $(use_enable static-libs static)
}
src_install() {
	default
	find "${D}" -name '*.la' -delete || die
}


# vim: filetype=ebuild
