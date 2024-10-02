# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/46bd413718501a24afaf60fa36bad799d5e296d6 -> cargo-c-0.10.4-46bd413.tar.gz
https://distfiles.macaronios.org/0b/b5/ae/0bb5aef1f24f9abcb25b3f30a270392220ac8533c107c0f05b81355ee26041743e2a91551be2bdec3349f2388e768986b51f9bee6984ae846eace8f016303a95 -> cargo-c-0.10.4-funtoo-crates-bundle-5d793e7801e5528e70c6109404fc88da589ca40c81cfc6726a82dc0b9f38daef49a93b11b0999356bc60ba5f33793561ecec8e7efbe1946758c32c74c7d1b907.tar.gz"

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