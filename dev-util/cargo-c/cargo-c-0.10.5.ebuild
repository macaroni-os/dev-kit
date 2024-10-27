# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/b6081a47813aab0175645e332b14282c651c893d -> cargo-c-0.10.5-b6081a4.tar.gz
https://distfiles.macaronios.org/e0/29/af/e029af70e2c65b56c82ea00fdb1087fd18e13f5a4f7cd118a69f99af82c152199b25cbf72fedfada470c0350452e71c42bf677bf9fce45bd648b435f4f0d72c7 -> cargo-c-0.10.5-funtoo-crates-bundle-c9251d744d3ce25287cadfcea64b0a507c2751458b6b0a7a322217a30def04636ccc7f50d08ca7fda7403459302e3d328dc3e946198f152fb77e3d5dd634d703.tar.gz"

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