# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A Rust compiler front-end for IDEs"
HOMEPAGE="https://rust-analyzer.github.io/ https://github.com/rust-lang/rust-analyzer"
SRC_URI="https://github.com/rust-lang/rust-analyzer/tarball/d8887c0758bbd2d5f752d5bd405d4491e90e7ed6 -> rust-analyzer-20250428-d8887c0.tar.gz
https://distfiles.macaronios.org/d7/a2/34/d7a2342527770652c60f8e038bee083018e9c6f74a676a6c6533adeb9e2388d201fe71c44da673686b056692575dbe550dcf349e3e5e212cd99f52d179fae4a4 -> rust-analyzer-20250428-funtoo-crates-bundle-9a9e22e02bbeb86b673a73e6c1e04c2d776d9b51246caac6dd7bd1f4b7db7b9c34a63cdd03d66b6fcad926ec3761f41535f829e5176306e5d096842372c89ec7.tar.gz"

LICENSE="Apache-2.0 Boost-1.0 BSD BSD-2 CC0-1.0 ISC LGPL-3+ MIT Apache-2.0 Unlicense ZLIB"
SLOT="0"
KEYWORDS="*"

DEPEND=""
RDEPEND=""
BDEPEND="virtual/rust"

QA_FLAGS_IGNORED="/usr/bin/rust-analyzer"

src_unpack() {
	cargo_src_unpack
	rm -rf ${S}
	mv ${WORKDIR}/rust-lang-rust-analyzer-* ${S} || die
}

# To populate a custom version for rust-analyzer use the CFG_RELEASE environmental variable
# If this is not set rust-analyzer --version will return 0.0.0
# Upstream code reference: https://github.com/rust-lang/rust-analyzer/blob/master/crates/rust-analyzer/src/version.rs
src_install() {
	RUST_VERSION="$(rustc --version | awk {'print $2'})"
	CFG_RELEASE="$RUST_VERSION (-standalone-funtoo)" cargo_src_install --path "./crates/rust-analyzer"
	einstalldocs
}