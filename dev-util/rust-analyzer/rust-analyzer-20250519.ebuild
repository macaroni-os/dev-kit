# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A Rust compiler front-end for IDEs"
HOMEPAGE="https://rust-analyzer.github.io/ https://github.com/rust-lang/rust-analyzer"
SRC_URI="https://github.com/rust-lang/rust-analyzer/tarball/e464ff8c755c6e12540a45b83274ec4de4829191 -> rust-analyzer-20250519-e464ff8.tar.gz
https://distfiles.macaronios.org/3e/86/d9/3e86d9ef0f5f5da987d5c417c150ac0bf208338bfa1949847fc9bb0d77d35618c7db4abe325233bef17f5e641f2db767ecea23b42c6c06c4aef37f1e5283ba90 -> rust-analyzer-20250519-funtoo-crates-bundle-558ca4b79f1b6e803dad75a7fca57e8403d37cdfd9874d052f4149b5a24ae7abf0b0201d10c258b9a41a9d1bde6e793b1b9346fb443f59422a649d276adc9220.tar.gz"

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