# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Source code spell checker"
HOMEPAGE="https://github.com/crate-ci/typos"
SRC_URI="https://github.com/crate-ci/typos/tarball/963c545f6b32b8572104c43605e663e84adbb9fb -> typos-1.26.1-963c545.tar.gz
https://distfiles.macaronios.org/ca/ea/1b/caea1bd9240062d1dbeab5de0a0e7efc483c3ce6ecc453480828ae9331f6f457016240f88f41218e729ed1b2d5429f0ef4b000a3fad94a01a280c770ebc3f659 -> typos-1.26.1-funtoo-crates-bundle-1b78e0129f38600d694dc9e1aff7bf7b3ecbef9c1c3230cdb783754bd0901d6342d67652388635e52e11c1d0e5077a4eb22a9fbfcaf0ca66e00f5ea21549c60f.tar.gz"

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