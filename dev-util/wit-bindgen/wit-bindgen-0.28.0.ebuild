# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A language binding generator for WebAssembly interface types"
HOMEPAGE="https://github.com/bytecodealliance/wit-bindgen"
SRC_URI="https://github.com/bytecodealliance/wit-bindgen/tarball/e103334cd1eef38b4ae9800dd6f09b4a8aec6e9d -> wit-bindgen-0.28.0-e103334.tar.gz
https://distfiles.macaronios.org/3c/1e/e4/3c1ee4634f9509d052cc25c800131b17f035564c620b3f55830334cb5f4b9c65cefac6193e037fb554ae866299a26f3b0d8ead271a4b9ee246f34e2459b30203 -> wit-bindgen-0.28.0-funtoo-crates-bundle-48aaab038b1b1dba1efc3e20014a9df4cdafc067fe6d22becfe2e3ed7e025221491643a8a3436023eed9ef9a57860038917ed4114675f01c29b76e7b085255ff.tar.gz"

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