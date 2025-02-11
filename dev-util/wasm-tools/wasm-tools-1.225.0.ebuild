# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION=" CLI and Rust libraries for low-level manipulation of WebAssembly modules "
HOMEPAGE="https://github.com/bytecodealliance/wasm-tools"
SRC_URI="https://github.com/bytecodealliance/wasm-tools/tarball/6a44095585f44da2adf63964701748bcef7be6e9 -> wasm-tools-1.225.0-6a44095.tar.gz
https://distfiles.macaronios.org/3b/0b/2b/3b0b2b3a3e37b631484548425711094ce5d72e0b7d454e3fe04d4e4c6a1495957bb64bc0ed2d1094cdf3361bf06ea37466042c2b8c821429a3f80df9ce87a0c7 -> wasm-tools-1.225.0-funtoo-crates-bundle-c6e57fbec56d7fcfea198be8a5806f60def1838b0780a4d340f4219cb17f54e817ad06a5b9ca3d344b9ddd9c8c451681751e2b455f0c494d73a56929081dccb5.tar.gz"

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