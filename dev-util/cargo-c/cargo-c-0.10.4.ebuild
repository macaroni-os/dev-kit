# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/46bd413718501a24afaf60fa36bad799d5e296d6 -> cargo-c-0.10.4-46bd413.tar.gz
https://distfiles.macaronios.org/55/1d/e1/551de1da3a1a39d1dad8c26e880af658e4991854dc4274826317d68bb52014b9ad9ecf01ea9151688c8bfcc794ba3af83e9bbe10a0e1fe166e88e25a3efc23ff -> cargo-c-0.10.4-funtoo-crates-bundle-f14ea58aeb5fb08d2ffa91cfca3060e0fc3e360a0838fc04d2bb830eba3c5e947382525c4f0a1daad0329cce2046840d5c77f65b8df4687d9089ecfea4f78dfc.tar.gz"

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