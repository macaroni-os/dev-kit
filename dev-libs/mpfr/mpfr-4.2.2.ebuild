# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7
HTML_DOCS=( doc/FAQ.html )

DESCRIPTION="Library for multiple-precision floating-point computations with exact rounding"
HOMEPAGE="https://www.mpfr.org/"
SRC_URI="https://www.mpfr.org/mpfr-current/mpfr-4.2.2.tar.xz -> mpfr-4.2.2.tar.xz"
LICENSE="LGPL-3+"
SLOT="0"
KEYWORDS="*"
IUSE="static-libs"
RDEPEND="dev-libs/gmp:=[static-libs?]
	
"
DEPEND="${RDEPEND}
"
src_configure() {
	ECONF_SOURCE="${S}" \
	  user_redefine_cc=yes \
	  econf $(use_enable static-libs static)
}
src_install() {
	default
	rm "${ED}"/usr/share/doc/${PF}/COPYING* || die
	if ! use static-libs ; then
	  find "${ED}"/usr -name '*.la' -delete || die
	fi
}


# vim: filetype=ebuild
