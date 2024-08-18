# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/ee7d7ef74b9c1fa00c6780da41a838752c76b3eb -> cargo-c-0.10.3-ee7d7ef.tar.gz
https://distfiles.macaronios.org/9d/12/d6/9d12d6fceb3e1391498a4428e16cfd69ef5646336823341d60a4bde749748796670f8630512cea8a60b0e1ed41a264f8afcee9bfbaaba3f4d460ef5c1e3f83ed -> cargo-c-0.10.3-funtoo-crates-bundle-adea46420d5dd225cb92c2e1fc6d9e67f3130882a2377e83f882c82824d1aedf3c1719f72ababe6b36c3bd97ee8e6e8fe382e5c2db7d394fcfaa10ae322a7388.tar.gz"

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