# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A Rust compiler front-end for IDEs"
HOMEPAGE="https://rust-analyzer.github.io/ https://github.com/rust-lang/rust-analyzer"
SRC_URI="https://github.com/rust-lang/rust-analyzer/tarball/1301e4268f44e404f0a5847ed72a0b4879e253d3 -> rust-analyzer-20240923-1301e42.tar.gz
https://distfiles.macaronios.org/9d/20/c8/9d20c8d29f672bd0dd0b0974d08d94b9d3b05a8e2d8a490e294e47a0957c9cb7563d430ac436b718d39e5000b07ffac421b8d1a09cf8a9ce2976bc6bce0954cc -> rust-analyzer-20240923-funtoo-crates-bundle-bc3544eabbab215b5eb01c55f8eb8976a2bf2506e00d40925e4fe9014691019fabf468b98a7af8cdc2080aebdd76838a4e375160869b1c176cde5653cf273d77.tar.gz"

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