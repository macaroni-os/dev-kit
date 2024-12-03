# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A Rust compiler front-end for IDEs"
HOMEPAGE="https://rust-analyzer.github.io/ https://github.com/rust-lang/rust-analyzer"
SRC_URI="https://github.com/rust-lang/rust-analyzer/tarball/b65911d5eecfa562532549ef7e70e460eb042e2c -> rust-analyzer-20241202-b65911d.tar.gz
https://distfiles.macaronios.org/2f/75/b2/2f75b27e21c0ccb3c6fc706905530cf298559e6038205e4f436e5b5fa26ba8eb2a426f90d649458cdc8b2c2d0f222395328e1694d6b3fc4ec2744592a41acf26 -> rust-analyzer-20241202-funtoo-crates-bundle-87d05a135222bbde9905e48e55504fa95b24c0494c447a9ce617e161d95a0b9dd4f064374dba1fd13fe8ef117329ca436ad6e50a4c42f4d4a31ca6349dd50e51.tar.gz"

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