# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Just a command runner"
HOMEPAGE="https://github.com/casey/just"
SRC_URI="https://github.com/casey/just/tarball/ae09563eda15e62a88e390dc9dd8bb7d91bb84cc -> just-1.36.0-ae09563.tar.gz
https://distfiles.macaronios.org/b1/de/21/b1de219a5221c5bfe51b82507a12ff1a7b7d21b771d4986e9d78b462aacbbd414473612f9a220662026c27e2be02bb80e0537abbd06b0365f8c4d872389983a4 -> just-1.36.0-funtoo-crates-bundle-c93f937fa8c0bbc27234f80c7776e07b8c6ddd9ee1c0a8c7c8e315505392732640cfb9ed1dbfceaf512b9c95c9add6b1d9a94806bf79c33f8737e4becc2a01b9.tar.gz"

LICENSE="Apache-2.0 Boost-1.0 BSD BSD-2 CC0-1.0 ISC LGPL-3+ MIT Apache-2.0 Unlicense ZLIB"
SLOT="0"
KEYWORDS="*"

DEPEND=""
RDEPEND=""
BDEPEND="virtual/rust"

QA_FLAGS_IGNORED="/usr/bin/just"

src_unpack() {
	cargo_src_unpack
	rm -rf ${S}
	mv ${WORKDIR}/casey-just-* ${S} || die
}

src_install() {
	cargo_src_install

	mkdir ${S}/man
	${S}/target/release/just --man > ${S}/man/just.1
	doman man/just.1

	dodoc README.md
	einstalldocs
}