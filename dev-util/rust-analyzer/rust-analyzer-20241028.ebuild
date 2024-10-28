# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A Rust compiler front-end for IDEs"
HOMEPAGE="https://rust-analyzer.github.io/ https://github.com/rust-lang/rust-analyzer"
SRC_URI="https://github.com/rust-lang/rust-analyzer/tarball/3b3a87fe9bd3f2a79942babc1d1e385b6805c384 -> rust-analyzer-20241028-3b3a87f.tar.gz
https://distfiles.macaronios.org/85/8c/6e/858c6ef1254a28676d19c33074098b839223d884a93ee9e97de44cd65a05178b0cbc5b04ef1221d5b35c261110c559efee07198c9d5a95e20e5db54075ad69be -> rust-analyzer-20241028-funtoo-crates-bundle-f97c12000196b0f64b4770fcc725aaaeae2a2ce7ff49ccbf637058e32e11b25f6ea3a4f54d629bedb5f90c469902db100154dafffb1476cf12e28a166fd5d8e7.tar.gz"

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