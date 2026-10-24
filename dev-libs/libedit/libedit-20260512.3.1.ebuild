# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit autotools

DESCRIPTION="BSD replacement for libreadline"
HOMEPAGE="https://thrysoee.dk/editline/"
SRC_URI="https://thrysoee.dk/editline/libedit-20260512-3.1.tar.gz -> libedit-20260512-3.1.tar.gz"
LICENSE="BSD-2"
SLOT="0"
KEYWORDS="*"
IUSE="static-libs"
RDEPEND=">=sys-libs/ncurses-5.9-r3[static-libs?]
"
DEPEND="${RDEPEND}
"
S="${WORKDIR}/libedit-20260512-3.1"
src_prepare() {
	default
	eautoreconf
}

src_configure() {
	econf \
		$(use_enable static-libs static) \
		--enable-widec \
		--enable-fast-install
}

src_install() {
	emake DESTDIR="${D}" install
	einstalldocs
	find "${D}" -name '*.la' -delete || die
}


# vim: filetype=ebuild
