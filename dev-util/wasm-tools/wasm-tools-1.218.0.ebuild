# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION=" CLI and Rust libraries for low-level manipulation of WebAssembly modules "
HOMEPAGE="https://github.com/bytecodealliance/wasm-tools"
SRC_URI="https://github.com/bytecodealliance/wasm-tools/tarball/b330644a808dd8557c67cfc09abc6c8a114e2ea0 -> wasm-tools-1.218.0-b330644.tar.gz
https://distfiles.macaronios.org/6d/55/03/6d5503cce1c2b4ad841dbfc8e502621d1373a86b11de0b4aa07d3d170c89150c01d46a3a53911831eb21c1ead2ff9c62cf503c4c1d3fb7880a65baf5f5693dd2 -> wasm-tools-1.218.0-funtoo-crates-bundle-e4deff7fed69a5837682629b1ffff90ef6f5bcf89607719cc1db1ec433553fc8b7fe4ef4bc677e747a20d9fbee4b3251c04081f3622ef013d445b6896ae2711c.tar.gz"

LICENSE="Apache-2.0 Boost-1.0 BSD BSD-2 CC0-1.0 ISC LGPL-3+ MIT Apache-2.0 Unlicense ZLIB"
SLOT="0"
KEYWORDS="*"

DOCS=( README.md )

QA_FLAGS_IGNORED="/usr/bin/wasm-tools"

src_unpack() {
	cargo_src_unpack
	rm -rf ${S}
	mv ${WORKDIR}/bytecodealliance-wasm-tools-* ${S} || die
}

src_install() {
	cargo_src_install
	einstalldocs
}