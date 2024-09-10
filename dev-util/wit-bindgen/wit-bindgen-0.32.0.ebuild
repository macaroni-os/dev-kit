# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A language binding generator for WebAssembly interface types"
HOMEPAGE="https://github.com/bytecodealliance/wit-bindgen"
SRC_URI="https://github.com/bytecodealliance/wit-bindgen/tarball/dea39d07a6282da5cb7ff315802a5593d2962701 -> wit-bindgen-0.32.0-dea39d0.tar.gz
https://distfiles.macaronios.org/d6/d2/a2/d6d2a20043713a4a78fda0f820de59f2dd2018ae7db14893691d903e7d96aee19b20d827c11ceac398692f984fecd9f350cd835ca653e9eeb118a5ffee695c79 -> wit-bindgen-0.32.0-funtoo-crates-bundle-668c048d47ebafc8b80b206572c5603078d9ce5628d32dcd674d12b666cb0e215e16ee54e621d2bfd373436a9461a98a7b298e2a90f623e6d76a5d30c6fdc440.tar.gz"

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