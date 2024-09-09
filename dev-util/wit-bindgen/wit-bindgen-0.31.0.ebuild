# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A language binding generator for WebAssembly interface types"
HOMEPAGE="https://github.com/bytecodealliance/wit-bindgen"
SRC_URI="https://github.com/bytecodealliance/wit-bindgen/tarball/b09f234081f5e185b27067af07beda2f9f04e6c4 -> wit-bindgen-0.31.0-b09f234.tar.gz
https://distfiles.macaronios.org/bd/de/d5/bdded5ceb2740824d4c5b088e0cb4cf7711c480e64891e011cb5920a125c0e7cabd34fa02e64074f40ddf15ed67ab040ae54140c9276509a049ebe32bb0d8db7 -> wit-bindgen-0.31.0-funtoo-crates-bundle-d3dc0bcb0199936ee83a355c2afdc7a9a23ede82f0caf15d89ed01e9dd62440a20d84534a8619484ef3e664cf8616a3f800ed25223e9a468bcc514b9627ec40a.tar.gz"

LICENSE="Apache-2.0 Boost-1.0 BSD BSD-2 CC0-1.0 ISC LGPL-3+ MIT Apache-2.0 Unlicense ZLIB"
SLOT="0"
KEYWORDS="*"

DOCS=( README.md )

QA_FLAGS_IGNORED="/usr/bin/wit-bindgen"

src_unpack() {
	cargo_src_unpack
	rm -rf ${S}
	mv ${WORKDIR}/bytecodealliance-wit-bindgen-* ${S} || die
}

src_install() {
	cargo_src_install
	einstalldocs
}