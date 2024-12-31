# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Source code spell checker"
HOMEPAGE="https://github.com/crate-ci/typos"
SRC_URI="https://github.com/crate-ci/typos/tarball/c8fd3764afbf5eaf6e53d2e6571c835db2c8fa5f -> typos-1.29.0-c8fd376.tar.gz
https://distfiles.macaronios.org/8f/c2/a4/8fc2a43b5bf92587620e9ce9ed08843d1cf55ed3380058efeb7386147c5ca1c9f5ccebea12477f508917c8700c4dba873006216e9604dd42c5d247f6838e95ce -> typos-1.29.0-funtoo-crates-bundle-6dad1b05925cac5d60b39987f4e04f6a39177eecee1284426b6b829936e7def7c021a8cd1f9d0818373947ec4de31ea7dae4ea26e5d0cb6dcb4fcf30e2a7296c.tar.gz"

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