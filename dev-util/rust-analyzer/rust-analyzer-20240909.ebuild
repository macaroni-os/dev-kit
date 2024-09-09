# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A Rust compiler front-end for IDEs"
HOMEPAGE="https://rust-analyzer.github.io/ https://github.com/rust-lang/rust-analyzer"
SRC_URI="https://github.com/rust-lang/rust-analyzer/tarball/08c7bbc2dbe4dcc8968484f1a0e1e6fe7a1d4f6d -> rust-analyzer-20240909-08c7bbc.tar.gz
https://distfiles.macaronios.org/fd/03/0d/fd030d99907126d26661525ee8d7c911827c27aa77c3c5067fcba7710cfc8371ef56d06cd882626f4a023bdbf899733bbfe18e90376f8528edf71157dce0d1b2 -> rust-analyzer-20240909-funtoo-crates-bundle-bc3544eabbab215b5eb01c55f8eb8976a2bf2506e00d40925e4fe9014691019fabf468b98a7af8cdc2080aebdd76838a4e375160869b1c176cde5653cf273d77.tar.gz"

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