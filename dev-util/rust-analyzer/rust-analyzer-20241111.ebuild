# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A Rust compiler front-end for IDEs"
HOMEPAGE="https://rust-analyzer.github.io/ https://github.com/rust-lang/rust-analyzer"
SRC_URI="https://github.com/rust-lang/rust-analyzer/tarball/30e71b609b493897ed81f4fec95eb75d903820c9 -> rust-analyzer-20241111-30e71b6.tar.gz
https://distfiles.macaronios.org/40/d1/99/40d19905a18fee119fa44651c6265bb9548d622f4982e13ddb2dc79664e246e214e57ff96b804274dec836c8bdab043cb0ce7c6bb816c5dcf02705a6fec9c0f8 -> rust-analyzer-20241111-funtoo-crates-bundle-23f40ff33f8a47fff8ce6f39e47b282d81437e73e9d9305e587e907a6083f8784d28c2f7840fc0e9829ce7e43c6ea6322e0f271a2413f132b50c6d3bd9a94def.tar.gz"

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