# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Source code spell checker"
HOMEPAGE="https://github.com/crate-ci/typos"
SRC_URI="https://github.com/crate-ci/typos/tarball/3265cef783c98e382e561f6089c2179a7d91bf0d -> typos-1.29.1-3265cef.tar.gz
https://distfiles.macaronios.org/4a/9f/13/4a9f1376be7b39a7ca68a32c193205e58bd0c721900be89a4347e7c93ad32cf871e054bda04d5df3ce5ecf4f40f051a8a8585f7f70b8a8c01367b986c3f1f136 -> typos-1.29.1-funtoo-crates-bundle-1f13fb028e0453d89f3fb94540bc5b51e65fff83d89a6e892172627a96a204c774783c347730d0001902ec39023fc4b929a720bbecbe67e2eee337ed453afa92.tar.gz"

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