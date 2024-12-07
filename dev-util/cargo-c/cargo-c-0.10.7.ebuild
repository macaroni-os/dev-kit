# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/8914ddfa8d45a0c27abdb48708138a5bc32e5bd6 -> cargo-c-0.10.7-8914ddf.tar.gz
https://distfiles.macaronios.org/24/06/87/2406871bf466c97ca087ce41f539ed2c00622dc4f7849701742ebeed5a6ed366db077ce9cac42572e27eb29a429193dffa448509c252cc183631ff239fc10cba -> cargo-c-0.10.7-funtoo-crates-bundle-510303a642aec4f1bd4f41a5da4674f18cb85b1675beb05e73d133f3336c7f5358f97f69056a220e88ab9231ca19c15f170e7715fff792236994f46c0735d716.tar.gz"

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