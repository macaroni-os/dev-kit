# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A Rust compiler front-end for IDEs"
HOMEPAGE="https://rust-analyzer.github.io/ https://github.com/rust-lang/rust-analyzer"
SRC_URI="https://github.com/rust-lang/rust-analyzer/tarball/9323b5385863739d1c113f02e4cf3f2777c09977 -> rust-analyzer-20241021-9323b53.tar.gz
https://distfiles.macaronios.org/c4/20/31/c42031021510a89fcc602ae0365899024288d57520ac6587a8880dbb6fa9aac2befdcfcf1786ec576197f424aae8bea566dfdad76f19954513327b80ddd1f076 -> rust-analyzer-20241021-funtoo-crates-bundle-47860daf6a00164fed22b4598c7a5a5a54bf22a57f7d2656c16497552aa91b7d178357a2732bce95349b744ab20d5b4a0fe542126fd91454368fbf88a871c682.tar.gz"

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