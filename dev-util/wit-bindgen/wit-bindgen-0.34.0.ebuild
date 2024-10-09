# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A language binding generator for WebAssembly interface types"
HOMEPAGE="https://github.com/bytecodealliance/wit-bindgen"
SRC_URI="https://github.com/bytecodealliance/wit-bindgen/tarball/98b26cf9e011940b008351b93e7098dab1a5ff86 -> wit-bindgen-0.34.0-98b26cf.tar.gz
https://distfiles.macaronios.org/fa/44/e2/fa44e22abf2ae461e08fd613abb79eb50526ae6b6cd2345a25ae89e3a9d57cb627bee729a5c9c429516f6c4c22b7e9b42d62a1db0b2aeae7b411750e75447ce1 -> wit-bindgen-0.34.0-funtoo-crates-bundle-900b9c1c98f11cedceab684925e3d9b6236cf8e45f8e49c92bbf418ddad1c5af2b300fa5d7064a14131b64c147e823537ce7617a2f737009dc121a07fde0727d.tar.gz"

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