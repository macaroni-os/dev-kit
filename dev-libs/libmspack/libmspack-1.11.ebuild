# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
inherit autotools

DESCRIPTION="A library for some loosely related Microsoft compression formats, CAB, CHM, HLP, LIT, KWAJ and SZDD."
HOMEPAGE="https://www.cabextract.org.uk/libmspack/"
SRC_URI="https://api.github.com/repos/kyz/libmspack/tarball/refs/tags/v1.11 -> libmspack-1.11-3059077.tar.gz"
SLOT="0"
KEYWORDS="*"
IUSE="debug doc"
S="${WORKDIR}/libmspack-1.11/libmspack"
post_src_unpack() {
	mv kyz-* libmspack-1.11
}
src_prepare() {
	default
	eautoreconf
}
src_configure() {
	econf $(use_enable debug)
}
src_install() {
	use doc && HTML_DOCS=( doc/. )
	default
	if use doc ; then
	  rm "${ED}"/usr/share/doc/"${PF}"/html/{Makefile*,Doxyfile*} || die
	fi
	find "${ED}" -name '*.la' -delete || die
	find "${ED}" -name "*.a" -delete || die
}


# vim: filetype=ebuild
