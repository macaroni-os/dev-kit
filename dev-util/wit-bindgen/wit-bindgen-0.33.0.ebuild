# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A language binding generator for WebAssembly interface types"
HOMEPAGE="https://github.com/bytecodealliance/wit-bindgen"
SRC_URI="https://github.com/bytecodealliance/wit-bindgen/tarball/66bfda38bee488df27692311e364d79a3cd301a7 -> wit-bindgen-0.33.0-66bfda3.tar.gz
https://distfiles.macaronios.org/44/57/89/4457894a9c53ba5077c1ac203b161156b706ca4309657f70013f79b5e4c8a8e2c3a732baf1906bc73fff61db3badc185b5bdf6079d47bf500b59ff9e0457c42b -> wit-bindgen-0.33.0-funtoo-crates-bundle-97ce4c85480bb73980197afa231f67649d0520658263c90ffe39e72a9037c897c8485d831b2b505aa27b9c4aebb085cfe0bca2963bcaa5163ff5d92cd11554f6.tar.gz"

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