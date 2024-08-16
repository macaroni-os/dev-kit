# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Source code spell checker"
HOMEPAGE="https://github.com/crate-ci/typos"
SRC_URI="https://github.com/crate-ci/typos/tarball/935271f0204ebdf61717cf6caac31d8d115f1c14 -> typos-1.23.6-935271f.tar.gz
https://distfiles.macaronios.org/0c/d9/de/0cd9de884e99557d2b35ea6c735a33ae5dfa0b806951399363133be3e360f20ead8173eab4e73a7a561ad664b67d45e7f79b2e44a7244879ba8785b4ffeea1d5 -> typos-1.23.6-funtoo-crates-bundle-577631637e02f939e4530005aea1ad7985c75d5e30e3bf59c81b98a641880fab820c5caa8774f6c21a6895c4060a3eab578aa9aecd85114f36dfc8624c25b158.tar.gz"

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