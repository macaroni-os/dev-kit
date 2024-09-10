# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A language binding generator for WebAssembly interface types"
HOMEPAGE="https://github.com/bytecodealliance/wit-bindgen"
SRC_URI="https://github.com/bytecodealliance/wit-bindgen/tarball/dea39d07a6282da5cb7ff315802a5593d2962701 -> wit-bindgen-0.32.0-dea39d0.tar.gz
https://distfiles.macaronios.org/cf/f0/82/cff082b64664ef64cf5c32baf52c532d555ba35a496a6f34ae0bd087063e3c501c9556873543b9ba83ef3d127cdf961553f2aa4d300dff4b09d40459b7307a64 -> wit-bindgen-0.32.0-funtoo-crates-bundle-668c048d47ebafc8b80b206572c5603078d9ce5628d32dcd674d12b666cb0e215e16ee54e621d2bfd373436a9461a98a7b298e2a90f623e6d76a5d30c6fdc440.tar.gz"

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