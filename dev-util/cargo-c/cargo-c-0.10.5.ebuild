# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/b6081a47813aab0175645e332b14282c651c893d -> cargo-c-0.10.5-b6081a4.tar.gz
https://distfiles.macaronios.org/6b/b6/59/6bb6595fd4a5b3ccd1945d3a3bd05610f2e4f71f7c8c2f4ad77e10fa781aca33c2238036d607ff7ef8adca08803a86f53373dc52cf2b601335ac77beded91ece -> cargo-c-0.10.5-funtoo-crates-bundle-44834ac4bf7355e5d930bf43cc3bb793e911f7b6b4fa970e4363e38720abcba2d759623a1a5de9c4deca00993e33bae5ea8bc95f145b3ab76ecf843f74f1d4cb.tar.gz"

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