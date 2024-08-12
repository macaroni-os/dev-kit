# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/ee7d7ef74b9c1fa00c6780da41a838752c76b3eb -> cargo-c-0.10.3-ee7d7ef.tar.gz
https://distfiles.macaronios.org/61/ff/58/61ff58e253ef977c92666a5634b5161339165080d733676467b15ddde0f61e3c067029851b20217456f2a59a5009efecf736e278262e909fec76995d5748d9b0 -> cargo-c-0.10.3-funtoo-crates-bundle-a940d00daf2fc1e030acfa3b63846ae7ba303a9d450bd6087b89410acf187e2d1b12209000a842f1112f6ea97e095f6cd73a485758b6ef491da2ec6bf947149e.tar.gz"

LICENSE="Apache-2.0 Boost-1.0 BSD BSD-2 CC0-1.0 ISC LGPL-3+ MIT Apache-2.0 Unlicense ZLIB"
SLOT="0"
KEYWORDS="*"

DEPEND=""
RDEPEND="sys-libs/zlib
	dev-libs/openssl:0=
	dev-vcs/git
	net-misc/curl[ssl]
"
BDEPEND="virtual/rust"

src_unpack() {
	cargo_src_unpack
	rm -rf ${S}
	mv ${WORKDIR}/lu-zero-cargo-c-* ${S} || die
}