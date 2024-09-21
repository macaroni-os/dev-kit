# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/46bd413718501a24afaf60fa36bad799d5e296d6 -> cargo-c-0.10.4-46bd413.tar.gz
https://distfiles.macaronios.org/68/bd/f3/68bdf3c2a82499c2460fe21353fc1773b4038bda465a6c84948a425b6c0b83e2ec04a289db239b1db6151a8329db63836bc7ceb376dfc6d5dabbf301186642de -> cargo-c-0.10.4-funtoo-crates-bundle-8445d96e1b3a1a8c2aee8f9a35597913cc88931f52f0d8c05a9aace7e7a743f1c3c22f066695dbe26a84d71511c86035300239da8bc591400e526db8c3b6fb00.tar.gz"

LICENSE="Apache-2.0 Boost-1.0 BSD BSD-2 CC0-1.0 ISC LGPL-3+ MIT Apache-2.0 Unlicense ZLIB"
SLOT="0"
KEYWORDS="*"

DEPEND=""
RDEPEND="sys-libs/zlib
	dev-libs/openssl:0=
	dev-vcs/git
	net-misc/curl[ssl]
"
BDEPEND="virtual/rust"

src_unpack() {
	cargo_src_unpack
	rm -rf ${S}
	mv ${WORKDIR}/lu-zero-cargo-c-* ${S} || die
}