# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A Rust compiler front-end for IDEs"
HOMEPAGE="https://rust-analyzer.github.io/ https://github.com/rust-lang/rust-analyzer"
SRC_URI="https://github.com/rust-lang/rust-analyzer/tarball/2bafe9d96c6734aacfd49e115f6cf61e7adc68bc -> rust-analyzer-20250512-2bafe9d.tar.gz
https://distfiles.macaronios.org/5f/2e/83/5f2e830ee2ae82c3ba4f27de139237eb94c5df4f67b2c834a3b82f218d5c1bf146c291365079323cf38da9dae2949688cccc10382fa349d0fe07781865ff29e4 -> rust-analyzer-20250512-funtoo-crates-bundle-74fa2db854582a4ddbfdead97f089b6b4368dfbac4231166f7712966f7ec331d6a8b9dde7f3829940eb5aa7ac663428e68f173022bc9059b4f2e3ddafdacf95b.tar.gz"

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