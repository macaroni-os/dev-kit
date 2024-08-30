# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/ee7d7ef74b9c1fa00c6780da41a838752c76b3eb -> cargo-c-0.10.3-ee7d7ef.tar.gz
https://distfiles.macaronios.org/5a/04/63/5a04635825a88c3f7a299e0e3df9cf64a361a4da5f83ddd3af544cb768b8bf1b6ac08416f0b6a38c0729600161b66bcf0a4b8f4aec7abda486338cdd98e4ec66 -> cargo-c-0.10.3-funtoo-crates-bundle-157ca1561638e4ec998796008349cc7dbb8956e73c64789eab39ee67ee2cc5c38dd107e8488a757ddd48d8dec41d2175ec428c3e027a176c063af37734a5f1c6.tar.gz"

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