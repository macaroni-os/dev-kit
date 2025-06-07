# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="GNU readline wrapper"
HOMEPAGE="http://utopia.knoware.nl/~hlub/uck/rlwrap/"
SRC_URI="http://utopia.knoware.nl/~hlub/uck/rlwrap/${P}.tar.gz"
SRC_URI="https://github.com/hanslub42/${PN}/releases/download/v${PV}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="*"
IUSE="debug"

RDEPEND="sys-libs/readline:0="
DEPEND="${RDEPEND}"

src_configure() {
	econf $(use_enable debug)
}
