# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Source code spell checker"
HOMEPAGE="https://github.com/crate-ci/typos"
SRC_URI="https://github.com/crate-ci/typos/tarball/7bc041cbb7ca9167c9e0e4ccbb26f48eb0f9d4e0 -> typos-1.30.2-7bc041c.tar.gz
https://distfiles.macaronios.org/77/36/51/773651f50ec296b93dbb2a93f74760f97ed017d185bdf2d3e3cf679029cfb8ac045890ab379efb9ab1ff54795e36fe7fe0e25c866ca749aff9a65560046ba1ad -> typos-1.30.2-funtoo-crates-bundle-64dae1098dbe729ea54f3f6eb30d8553ab97c6a3e57ac91ba7cd2c54bed7aba3014cadc127b0c836ed22d142025e51f116d370d73bcbe7c8e1970ded00cf24d9.tar.gz"

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