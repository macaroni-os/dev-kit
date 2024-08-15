# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/ee7d7ef74b9c1fa00c6780da41a838752c76b3eb -> cargo-c-0.10.3-ee7d7ef.tar.gz
https://distfiles.macaronios.org/61/4d/25/614d252cd2b04eb0f60ec247c98dad66da120c8e2b43452abfaf2c4adbb6dddafb47c85dffb64426754412868cf10d580fc6d4db4a651a24194e6385738b8447 -> cargo-c-0.10.3-funtoo-crates-bundle-a29eaa9b037222ad2ca63a20288a35837f67081b6d24bd3268a35a8814d67547ff497ce7fc69dbae3cc38d038abdf5c84e56e100582afeebf8f17df7cbcb9ef1.tar.gz"

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