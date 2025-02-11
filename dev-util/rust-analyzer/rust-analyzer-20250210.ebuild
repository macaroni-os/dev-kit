# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A Rust compiler front-end for IDEs"
HOMEPAGE="https://rust-analyzer.github.io/ https://github.com/rust-lang/rust-analyzer"
SRC_URI="https://github.com/rust-lang/rust-analyzer/tarball/35181e167efb94d5090df588e6af9f93250421f3 -> rust-analyzer-20250210-35181e1.tar.gz
https://distfiles.macaronios.org/57/b3/51/57b351fc8bb124cf0a739882006300b432edf90eb29aab6b4bda54d95e8a741d55327c68382ea04d0fe3bfb9879e4ad6b6690d0dde7fa4420f2875aba2ecab0d -> rust-analyzer-20250210-funtoo-crates-bundle-d8d5cf79ff345bbdc6aff50d0f7f31f56066a0b4cb91a1dd2d257b9562d577bde5b8c77ccc6c46f33df9fbecdaf9f7f55a5fab7184018cf14781352f7edf40ba.tar.gz"

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