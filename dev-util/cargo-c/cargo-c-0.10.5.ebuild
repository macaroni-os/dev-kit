# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/b6081a47813aab0175645e332b14282c651c893d -> cargo-c-0.10.5-b6081a4.tar.gz
https://distfiles.macaronios.org/87/ec/14/87ec148f4e46ad0515f4925c26736edc8d7819ca2d21ff12a43a542d02b1b240b8941e2b6bd7c025f45209ff3a6f75a262288a7c8fba5a8a57b6a2ea8a4980e8 -> cargo-c-0.10.5-funtoo-crates-bundle-a24ebd888532b9616950a3ea65436543c8e207f71fd013d0a6b01595eed3207433af5d9d76f757670dc495c2b5a886d5f5836cdcab84046e7ede17bac1b4ed4a.tar.gz"

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