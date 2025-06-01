# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A Rust compiler front-end for IDEs"
HOMEPAGE="https://rust-analyzer.github.io/ https://github.com/rust-lang/rust-analyzer"
SRC_URI="https://github.com/rust-lang/rust-analyzer/tarball/d2f17873ff19786a121fb3302f91779c1a1b957f -> rust-analyzer-20250526-d2f1787.tar.gz
https://distfiles.macaronios.org/66/ef/2e/66ef2e4c94f2ec15a1aac4984cb3cb66bada113e6a8132e2756369e65070436bc7d41460e259a3fe060e8945f1ccc037364af6de3c21626f63ab65bcbf21c16e -> rust-analyzer-20250526-funtoo-crates-bundle-322fd17ac1a458c49cc9af55b80ec30acf64c41acd7436c01783823dd59408486eba268490799af8d6b40f68f43b3e6d14e8a20606c6387b8e8adb03b92ed716.tar.gz"

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