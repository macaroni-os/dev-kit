# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/8914ddfa8d45a0c27abdb48708138a5bc32e5bd6 -> cargo-c-0.10.7-8914ddf.tar.gz
https://distfiles.macaronios.org/06/cd/99/06cd997abe4c79316489f9128191133233aeca749efea83f56f52d67c3996e6e23711780d6b6dfc445bab9548266f72959dc5de7d1d27a173d1282005b3887d1 -> cargo-c-0.10.7-funtoo-crates-bundle-3bd15c03fa33d4f43f8aeed296fd546a0eda014cb7d8a91624208d29e620b6844edc3349717cf6c8926445b21496bb3c151864347f52ed89118747f23775fece.tar.gz"

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