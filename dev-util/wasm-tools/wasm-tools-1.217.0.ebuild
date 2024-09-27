# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION=" CLI and Rust libraries for low-level manipulation of WebAssembly modules "
HOMEPAGE="https://github.com/bytecodealliance/wasm-tools"
SRC_URI="https://github.com/bytecodealliance/wasm-tools/tarball/46cb2e80abe9e57c422a3496032dd4c49bdefcd9 -> wasm-tools-1.217.0-46cb2e8.tar.gz
https://distfiles.macaronios.org/be/92/b9/be92b90cf3850dccf2730a91e74df20661ec4b30b322f61ddc2bebd09bd6aa075859e144eb00a43ee0a2f298ea1b3d18114f8a648dc634450fe09ac2ac3073e5 -> wasm-tools-1.217.0-funtoo-crates-bundle-8f2bdc606bbb26526d945242f9914a478566b3944df6201cfb13788e7e0524b5945ef4a8ad957516c20d647a074ddf889c3ab8615fde16bbc00d7be226a2ea36.tar.gz"

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