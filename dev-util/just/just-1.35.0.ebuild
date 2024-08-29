# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Just a command runner"
HOMEPAGE="https://github.com/casey/just"
SRC_URI="https://github.com/casey/just/tarball/b9e1b9e7aba755e680d6b85bb273a12b3c91c643 -> just-1.35.0-b9e1b9e.tar.gz
https://distfiles.macaronios.org/9d/4f/81/9d4f81f55962194cf66113edd27f68c853fa7e1d1348b13a8c68cc224497d13dfead051983ed8bebaf6fb6bf3f0a9c132fae9f7372551c124e4fa86964f390b1 -> just-1.35.0-funtoo-crates-bundle-1e0de0a83cfd10e22288c5681130a14e12bd0cd502c96dbca5d613bd0b3578f6a00dd2cd63edf3fef78ac19b387dc38c7e41f0712af1ed41502f0033eca2ee26.tar.gz"

LICENSE="Apache-2.0 Boost-1.0 BSD BSD-2 CC0-1.0 ISC LGPL-3+ MIT Apache-2.0 Unlicense ZLIB"
SLOT="0"
KEYWORDS="*"

DEPEND=""
RDEPEND=""
BDEPEND="virtual/rust"

QA_FLAGS_IGNORED="/usr/bin/just"

src_unpack() {
	cargo_src_unpack
	rm -rf ${S}
	mv ${WORKDIR}/casey-just-* ${S} || die
}

src_install() {
	cargo_src_install

	mkdir ${S}/man
	${S}/target/release/just --man > ${S}/man/just.1
	doman man/just.1

	dodoc README.md
	einstalldocs
}