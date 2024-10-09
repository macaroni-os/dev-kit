# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION=" CLI and Rust libraries for low-level manipulation of WebAssembly modules "
HOMEPAGE="https://github.com/bytecodealliance/wasm-tools"
SRC_URI="https://github.com/bytecodealliance/wasm-tools/tarball/0261534e96012f4e82c0d9f83b65be8d91d4fbac -> wasm-tools-1.219.0-0261534.tar.gz
https://distfiles.macaronios.org/85/db/b4/85dbb4f61d2fd0ef507b74e794cd06e8665bd5d40e90dd76930b3f27ffa3f2513e70de50c73aa24e828e5e268152250c8d2c060775be89984a71dccd429390fa -> wasm-tools-1.219.0-funtoo-crates-bundle-3c4f547a8f6df7258724f633373008cad2794d8c068db67b80b1b9e59a57c84c3b21e5b1c9c6926e9de4ec74aa808e65d15b67a7a6d19d74ed040fc4cdfb39bf.tar.gz"

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