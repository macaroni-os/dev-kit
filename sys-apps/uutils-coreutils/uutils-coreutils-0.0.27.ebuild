# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Cross-platform Rust rewrite of the GNU coreutils"
HOMEPAGE="https://github.com/uutils/coreutils https://uutils.github.io/coreutils/docs/"
SRC_URI="https://github.com/uutils/coreutils/tarball/0aacc2a5a57ffed76facaecb6b2451394b46fa85 -> coreutils-0.0.27-0aacc2a.tar.gz
https://distfiles.macaronios.org/c7/27/a7/c727a7a94be5f524f6ce96c0e131e5267524ed9666fad3c44eed70785272a53250dad8ea56916b7e07c019d9753537d8e641d041619340c6ad20ae392caec419 -> uutils-coreutils-0.0.27-funtoo-crates-bundle-baf3b4974cfef377fa120e2fcb13d249b26ebce7e113c5d2aa05baf869aa598c52d5f872627bffb946b2846f14e7ea0bf6f5a20b8ad4031d9b99df29548e7d8a.tar.gz"

LICENSE="Apache-2.0 Boost-1.0 BSD BSD-2 CC0-1.0 ISC LGPL-3+ MIT Apache-2.0 Unlicense ZLIB"
SLOT="0"
KEYWORDS="*"

DEPEND=""
RDEPEND=""
BDEPEND="virtual/rust"

DOCS=( README.md )

QA_FLAGS_IGNORED="/usr/bin/coreutils"

src_unpack() {
	cargo_src_unpack
	rm -rf ${S}
	mv ${WORKDIR}/uutils-coreutils-* ${S} || die
}

src_configure() {
	cargo_src_configure --features unix
}

src_install() {
	cargo_src_install
	einstalldocs
}