# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Source code spell checker"
HOMEPAGE="https://github.com/crate-ci/typos"
SRC_URI="https://github.com/crate-ci/typos/tarball/cbb98c663b362e22c2b411e82b11beeeeb530349 -> typos-1.23.7-cbb98c6.tar.gz
https://distfiles.macaronios.org/07/c7/c0/07c7c0c2444e282067900d451b8e94b1c143abd6fa148e20f7bec98b000a55cfc81e2731e596dc1e7816151fe84fdb89ac52f5a00b92dae261c68b8c56f27fd0 -> typos-1.23.7-funtoo-crates-bundle-8505e3adb2c68d1fab0e32580d4c980523fab58454fba4a473f11a9a5af018a0079186aaa139d8b5f592e022de930c11c87a8ff98d447ac5f12e8f23b862b415.tar.gz"

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