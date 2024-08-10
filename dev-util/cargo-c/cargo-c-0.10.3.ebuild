# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/ee7d7ef74b9c1fa00c6780da41a838752c76b3eb -> cargo-c-0.10.3-ee7d7ef.tar.gz
https://distfiles.macaronios.org/76/ca/12/76ca121e6f7d4209d136b6d2d88b67e76b269db14189317362253f7bd68c43c897640260b4f5e7df1db6b05cef2e43fa067c473de8866fc96e4e6d58b85f6fff -> cargo-c-0.10.3-funtoo-crates-bundle-2612ba28bbb0a290791a2febd22e835ad62879dc68f5038710b72973c2da6a5b0ea80e2f5a2f058501e096f690d996ee25cea9bba07b8ad5c19dcb233ea47cb3.tar.gz"

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