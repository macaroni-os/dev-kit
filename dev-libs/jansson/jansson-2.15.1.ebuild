# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit autotools

DESCRIPTION="C library for encoding, decoding and manipulating JSON data"
HOMEPAGE="http://www.digip.org/jansson/"
SRC_URI="https://api.github.com/repos/akheron/jansson/tarball/v2.15.1 -> jansson-2.15.1-dbb5fb3.tar.gz"
LICENSE="MIT"
SLOT="0"
KEYWORDS="*"
IUSE="static-libs"

post_src_unpack() {
	mv akheron-jansson-* ${S}
}


src_prepare() {
	default
	eautoreconf
}
src_configure() {
	ECONF_SOURCE="${S}" econf \
	  $(use_enable static-libs static)
}
src_install() {
	default
	find "${D}" -name '*.la' -delete || die
}



# vim: filetype=ebuild
