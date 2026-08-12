# Distributed under the terms of the GNU General Public License v2
# Autogen by MARK Devkit

EAPI=7

DESCRIPTION="A library for multiprecision complex arithmetic with exact rounding"
HOMEPAGE="https://www.multiprecision.org/mpc/ https://gitlab.inria.fr/mpc/mpc"
SRC_URI="https://ftp.gnu.org/gnu/mpc/mpc-1.4.1.tar.xz -> mpc-1.4.1.tar.xz"
LICENSE="LGPL-3+ FDL-1.3+"
SLOT="0"
KEYWORDS="*"
IUSE="static-libs"
RDEPEND="dev-libs/gmp:=[static-libs?]
	dev-libs/mpfr:=[static-libs?]
	
"
DEPEND="${RDEPEND}
"
src_configure() {
	local myeconfargs=(
	  $(use_enable static-libs static)
	)
	econf "${myeconfargs[@]}"
}
src_install() {
	default
	einstalldocs
	find "${ED}" -name '*.la' -delete || die
}


# vim: filetype=ebuild
