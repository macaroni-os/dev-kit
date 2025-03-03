# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A language binding generator for WebAssembly interface types"
HOMEPAGE="https://github.com/bytecodealliance/wit-bindgen"
SRC_URI="https://github.com/bytecodealliance/wit-bindgen/tarball/f2393e6e98fa5f9236cac580db8a3fc9de6a4b70 -> wit-bindgen-0.39.0-f2393e6.tar.gz
https://distfiles.macaronios.org/0b/4f/88/0b4f88a5b3f7527b017f4eec3e83d9bd9eec802272d678d5217fdb618dfc51865a7df718431d323fca03c33de51ca20aec1969b47d4e025c8c26092ff55929a7 -> wit-bindgen-0.39.0-funtoo-crates-bundle-03d4556439785ef4d07f366304daf24921802ce0127b93ef513031baa6ee4e6ee111245b7a04f59019e7c322049380836c381a2c3bccb5c6a7bfcdd429e08820.tar.gz"

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