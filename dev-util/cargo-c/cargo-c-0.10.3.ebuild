# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/ee7d7ef74b9c1fa00c6780da41a838752c76b3eb -> cargo-c-0.10.3-ee7d7ef.tar.gz
https://distfiles.macaronios.org/3e/6f/03/3e6f032be4eff116ac7259ee36a8e749c9af87226a743745e4e5601ca19d4537c9e5ec276f161c8dc89c4c46610b8e20809154ae3d330deda21f2709f2f960ef -> cargo-c-0.10.3-funtoo-crates-bundle-6cd456c9ba7b9e410cac625b7c74720c2ae6377cda2b2fed423a8169de6c5c147de1a6b944a4b6785dec90aef9f5bbc3dd93ce52c2e1f80a52b136a68667ff10.tar.gz"

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