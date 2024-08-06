# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A language binding generator for WebAssembly interface types"
HOMEPAGE="https://github.com/bytecodealliance/wit-bindgen"
SRC_URI="https://github.com/bytecodealliance/wit-bindgen/tarball/a20a9497019fc6ad7c7d6f10d1a6dae8c127a392 -> wit-bindgen-0.29.0-a20a949.tar.gz
https://distfiles.macaronios.org/6b/84/37/6b8437ad90d9c842f5df9ac7e2606ab45c95c1263018313b2f8dad46fc5a5c3b60a14139ec5fcc04418a1242fdda5794c6f982aea2a3f7a2abe2b9ef263b6806 -> wit-bindgen-0.29.0-funtoo-crates-bundle-78e0747f7ade9cbaf97cd9358dcb31489b907b73a70df6c688a334700b649f32596c15b1ad4445f7529523ec6fe9376566603f66bc1d201a66a3f53a8ea27c0d.tar.gz"

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