# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools

DESCRIPTION="A tool for exporting C libraries into Scheme"
HOMEPAGE="http://www.nongnu.org/g-wrap/"
SRC_URI="http://download.savannah.gnu.org/releases/g-wrap/g-wrap-1.9.15.tar.gz -> g-wrap-1.9.15.tar.gz
"

SLOT="0"
LICENSE="GPL-2"
KEYWORDS="*"
IUSE=""

# guile-lib for srfi-34, srfi-35
RDEPEND="
	dev-libs/glib:2
	dev-scheme/guile-lib
	dev-scheme/guile[deprecated]
	virtual/libffi"
DEPEND="${RDEPEND}
	virtual/pkgconfig
	dev-util/indent"

src_configure() {
	econf --disable-Werror --with-glib
}

src_install() {
	default

	find "${D}" -name '*.la' -delete || die
}