# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/ee7d7ef74b9c1fa00c6780da41a838752c76b3eb -> cargo-c-0.10.3-ee7d7ef.tar.gz
https://distfiles.macaronios.org/f0/10/1d/f0101df307246378c8bc80de45c4b7b0ae3268a506eebc379e4ead5cd316895cd5bec51ef73e1b49553e584f8dfb45c88ffa9e0c384f6b5d8e15d1f226fd11ea -> cargo-c-0.10.3-funtoo-crates-bundle-11697789810706fb6d1f85b86e8657268a1fedfc75ec98d03e68649816393f729d63cdaa035f216cfc560fcdb6ef96974ed64afe1126f1d89047288c421ac619.tar.gz"

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