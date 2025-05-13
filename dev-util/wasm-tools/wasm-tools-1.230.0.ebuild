# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION=" CLI and Rust libraries for low-level manipulation of WebAssembly modules "
HOMEPAGE="https://github.com/bytecodealliance/wasm-tools"
SRC_URI="https://github.com/bytecodealliance/wasm-tools/tarball/2dbe8b9b88f646195bf9229aa7083cd5f2b62679 -> wasm-tools-1.230.0-2dbe8b9.tar.gz
https://distfiles.macaronios.org/fa/f3/af/faf3afe1d5505e5f75061b06e484b648b419dea773ab4095f19c94a4ba335612adba49c961a1df6042bef7369157d4a3f99c9859d1ed734e0130f7a4a47df0a9 -> wasm-tools-1.230.0-funtoo-crates-bundle-72fcbaa4b77cad492e08c0a04c6a7112feff0e0ee8136159967badf7696b4c32f636203e546f4087a125cc18fd955133558bf9305bb3c81dad4da6f8ace7b818.tar.gz"

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