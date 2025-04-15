# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A Rust compiler front-end for IDEs"
HOMEPAGE="https://rust-analyzer.github.io/ https://github.com/rust-lang/rust-analyzer"
SRC_URI="https://github.com/rust-lang/rust-analyzer/tarball/8365cf853e791c93fa8bc924f031f11949bb1a3c -> rust-analyzer-20250414-8365cf8.tar.gz
https://distfiles.macaronios.org/6c/b0/bb/6cb0bb9784d967f2228275952562debac0ab8bcff59708da36f76a857c8d5cadc3939136b7c067cf6a7dcee10c01bc4aa21fbda5e97a2ea108fc93b2ebcb06db -> rust-analyzer-20250414-funtoo-crates-bundle-29b1b0b000a2c7bda647fc23e19476a944f2905d8cf30ecefbc1d74f40353add161969d14e5d7ea336d12f65e1a72e03d1ecb023b2bb5c6a39094aa3bcb1c0f1.tar.gz"

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