# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Source code spell checker"
HOMEPAGE="https://github.com/crate-ci/typos"
SRC_URI="https://github.com/crate-ci/typos/tarball/8951ef9cb569c860bc8f3f18070fbfaf65cdb349 -> typos-1.30.0-8951ef9.tar.gz
https://distfiles.macaronios.org/63/12/cf/6312cff686ecb57c5876e31d37fdcfcd31fed3a2b17250618b2466e9f40d5984c8f846b814f838a70cebdb3360ab9361549344016bb24ddfaeaf349bd09ee219 -> typos-1.30.0-funtoo-crates-bundle-7962195f997cd7e63671493b8582e1c28dc892c723240f7e37706c9b023cc268222af8c90cbb52830c5df7fa5a679f59c75ac77506c3dea425c78ffca3d04a86.tar.gz"

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