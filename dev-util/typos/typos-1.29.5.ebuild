# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Source code spell checker"
HOMEPAGE="https://github.com/crate-ci/typos"
SRC_URI="https://github.com/crate-ci/typos/tarball/11ca4583f2f3f74c7e7785c0ecb20fe2c99a4308 -> typos-1.29.5-11ca458.tar.gz
https://distfiles.macaronios.org/2d/6c/d2/2d6cd2c54887daaf6e7f6dd163fd0c0089a09edff0a8b8bf45b90aef77550713eb21738f9be8b06fc351d85d2c273bfdb9298cfb8dc5e899a0a13ad511734f4f -> typos-1.29.5-funtoo-crates-bundle-fa8b77d43f2cd23f7ad467a547253a679b49ee51bcfebef1e40467177636b67ce78fd0849ebc982bacbc4817c72630181946397f779ddcceb900afbdefee0e69.tar.gz"

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