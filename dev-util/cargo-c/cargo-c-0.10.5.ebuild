# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/b6081a47813aab0175645e332b14282c651c893d -> cargo-c-0.10.5-b6081a4.tar.gz
https://distfiles.macaronios.org/7a/74/58/7a7458bddb793b018b262f75289fe84f892894908230998cb62810a2fead7c39adcb2695d63808b83786c0673e11b0930cf6a1e2ec8bc0c1cb5ed07fbaf09089 -> cargo-c-0.10.5-funtoo-crates-bundle-ed8d4e246c1ef0d3007e817f22573ef9f02eb6379878436b01ec220b28725a1e4bae88d214e8f179a9060553a2ce5c9e896d37a54ce009b2b40ecae6a4590f69.tar.gz"

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