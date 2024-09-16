# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Source code spell checker"
HOMEPAGE="https://github.com/crate-ci/typos"
SRC_URI="https://github.com/crate-ci/typos/tarball/8e6a4285bcbde632c5d79900a7779746e8b7ea3f -> typos-1.24.6-8e6a428.tar.gz
https://distfiles.macaronios.org/b3/36/a1/b336a1ed4816e200706ca693dc85c7e8f3c3d67fc62fbb69449044653c32ab54107f327c168f78cec96a8385d42df5375a7e8b97e9f2837c87cd82ef6ffb5155 -> typos-1.24.6-funtoo-crates-bundle-a1204a3a4f6ba641954960e7092abc2cf51f13c3e1245e1697c95375a74a7ad87fab8bbc481bd5fbac5ba6681efd11662dbc647f0830edc864d469a8f2b8eb60.tar.gz"

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