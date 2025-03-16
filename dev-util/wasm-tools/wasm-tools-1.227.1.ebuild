# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION=" CLI and Rust libraries for low-level manipulation of WebAssembly modules "
HOMEPAGE="https://github.com/bytecodealliance/wasm-tools"
SRC_URI="https://github.com/bytecodealliance/wasm-tools/tarball/3b3e1ac6c309c807a956ffffb8276a621a0a50fa -> wasm-tools-1.227.1-3b3e1ac.tar.gz
https://distfiles.macaronios.org/e5/23/b9/e523b9c661697ca32e462b0221ec5f6f2d0b6f9964a4a8531e8a9d8628cb3d8c687f016e4088d9d719fbcb48b19ef0ec174e4d093b609a88c8136c3f27f50735 -> wasm-tools-1.227.1-funtoo-crates-bundle-72fcbaa4b77cad492e08c0a04c6a7112feff0e0ee8136159967badf7696b4c32f636203e546f4087a125cc18fd955133558bf9305bb3c81dad4da6f8ace7b818.tar.gz"

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