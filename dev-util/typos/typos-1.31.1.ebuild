# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Source code spell checker"
HOMEPAGE="https://github.com/crate-ci/typos"
SRC_URI="https://github.com/crate-ci/typos/tarball/b1a1ef3893ff35ade0cfa71523852a49bfd05d19 -> typos-1.31.1-b1a1ef3.tar.gz
https://distfiles.macaronios.org/35/de/4c/35de4cdb7d2f71da260034858338f93c1d347882a009098064682987f6017352a227e07b568183013063114fbef3c5c50cd20e7df9cd845b9d4ed627e6ced46a -> typos-1.31.1-funtoo-crates-bundle-64dae1098dbe729ea54f3f6eb30d8553ab97c6a3e57ac91ba7cd2c54bed7aba3014cadc127b0c836ed22d142025e51f116d370d73bcbe7c8e1970ded00cf24d9.tar.gz"

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