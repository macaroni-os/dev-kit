# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A Rust compiler front-end for IDEs"
HOMEPAGE="https://rust-analyzer.github.io/ https://github.com/rust-lang/rust-analyzer"
SRC_URI="https://github.com/rust-lang/rust-analyzer/tarball/c9109f23de57359df39db6fa36b5ca4c64b671e1 -> rust-analyzer-20240805-c9109f2.tar.gz
https://distfiles.macaronios.org/1a/df/a1/1adfa1e3851d4fc38e2c936149f72b140005142e39bb4ff2c80229ead6587fd64a04fa5e90074bd08c13f69e216ca85760142f56e486c8779e68eec83618f6f3 -> rust-analyzer-20240805-funtoo-crates-bundle-faea7c031240d6657532aa2e1871d4d6c953b44d12ce47ba1f438fb923f3412a74ea5663a54c969208d5eb94aec771b23096dbb9c2f5daae07b2f9da456ec77f.tar.gz"

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