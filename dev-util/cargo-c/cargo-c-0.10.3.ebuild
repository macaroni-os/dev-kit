# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/ee7d7ef74b9c1fa00c6780da41a838752c76b3eb -> cargo-c-0.10.3-ee7d7ef.tar.gz
https://distfiles.macaronios.org/d3/3b/87/d33b8784155a5209794f3bc771ac293588ffafa9ba0ced778038c9220ce4f079765dc687f28b63fdcd38ad57983a43a4a60cf023e29c6df2cbb516a3d13e4d66 -> cargo-c-0.10.3-funtoo-crates-bundle-068b1b97ee1de4c36a8b954087ae426ba059e1f1b9d2fcbd1a5047610d52b2c2f2ecb5c192d911fa8b4a61c8671cd545643dfd00f7137cddb3159935e6eabf1f.tar.gz"

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