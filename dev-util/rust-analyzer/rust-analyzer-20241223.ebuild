# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A Rust compiler front-end for IDEs"
HOMEPAGE="https://rust-analyzer.github.io/ https://github.com/rust-lang/rust-analyzer"
SRC_URI="https://github.com/rust-lang/rust-analyzer/tarball/fa4a40bbe867ed54f5a7c905b591fd7d60ba35eb -> rust-analyzer-20241223-fa4a40b.tar.gz
https://distfiles.macaronios.org/ef/6d/ee/ef6deefee6018057202565463ec4a250eeda103962c9e779b15f14199d862e84f63c3916b99a6d74c7b3397e3f26388d2beb766978142eba3ed619cf80dd9832 -> rust-analyzer-20241223-funtoo-crates-bundle-eca09ee2e5651215486cbf88b5e5c8024b0a704a28c53b766da758db82cee80d6fa39c36a25f2d206315e8829f558377ff48c1248fe4bbf281d65acbb949e5e8.tar.gz"

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