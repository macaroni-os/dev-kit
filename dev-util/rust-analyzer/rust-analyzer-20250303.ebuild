# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A Rust compiler front-end for IDEs"
HOMEPAGE="https://rust-analyzer.github.io/ https://github.com/rust-lang/rust-analyzer"
SRC_URI="https://github.com/rust-lang/rust-analyzer/tarball/81ff38f53b9a14ac608feb30b21ed42a41d016c6 -> rust-analyzer-20250303-81ff38f.tar.gz
https://distfiles.macaronios.org/49/9d/03/499d03a7ccdd7c3ce0985a95a2b2b2f49b9fd2fe047be244fbb4b439dfcfcad5d46a2a082138e21475a0834fff4f4e43b9ab7975d12eede2f65d7c8bef295c89 -> rust-analyzer-20250303-funtoo-crates-bundle-71c1648ead189cd34d0f04905edb528f341af60ba9046c4f2158372724b2a016e2326badc3b1758683ebacca16720cbdd91fd6c54bb3a2d55f05b8717c8990bf.tar.gz"

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