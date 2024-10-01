# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Source code spell checker"
HOMEPAGE="https://github.com/crate-ci/typos"
SRC_URI="https://github.com/crate-ci/typos/tarball/f12cee1d8f3c79282a98ecb41d235aef17dfa8fd -> typos-1.25.0-f12cee1.tar.gz
https://distfiles.macaronios.org/f4/7b/c5/f47bc515fa5e54b61b19fbc16f508bfdc98a1745f1c5bb595f79881500f722fb66fc72e0fa877db11da61d90a928525fec42facaa614341baee68fb851f44f63 -> typos-1.25.0-funtoo-crates-bundle-0e4fc914a52338396fd7815564ff119ac7c6bd2152468326dd946dc8a01d05200d1a336badf3264d0b13d80d444fd1ec5b026766af639828158b18727878a785.tar.gz"

LICENSE="Apache-2.0 Boost-1.0 BSD BSD-2 CC0-1.0 ISC LGPL-3+ MIT Apache-2.0 Unlicense ZLIB"
SLOT="0"
KEYWORDS="*"

DEPEND=""
RDEPEND=""
BDEPEND="virtual/rust"

QA_FLAGS_IGNORED="/usr/bin/typos"

src_unpack() {
	cargo_src_unpack
	rm -rf ${S}
	mv ${WORKDIR}/crate-ci-typos-* ${S} || die
}

src_install() {
	exeinto /usr/bin
	doexe target/release/typos

	local DOCS=(
	docs/design.md
	docs/reference.md
	CHANGELOG.md README.md
	)
	einstalldocs
}