# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A language binding generator for WebAssembly interface types"
HOMEPAGE="https://github.com/bytecodealliance/wit-bindgen"
SRC_URI="https://github.com/bytecodealliance/wit-bindgen/tarball/d8994a329a74f6eb96c080b42765e42af6ef5be6 -> wit-bindgen-0.41.0-d8994a3.tar.gz
https://distfiles.macaronios.org/bd/ca/72/bdca72ea728ed755023e2376b052b43d608ab268372aa859bdb2df5ec179de75592c239e3911d39312db7d51fd3dde54e3089c1e08155d743aa8674d217e1316 -> wit-bindgen-0.41.0-funtoo-crates-bundle-76170d73bcf7362167a98218e1287c9a4f60b2025cc1de44900410f6cb124a3f7c3edac4ae84457ed0117f7340031dff26655b1c48cfbff4e141b93d7eeb8468.tar.gz"

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