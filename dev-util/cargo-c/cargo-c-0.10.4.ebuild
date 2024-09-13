# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/46bd413718501a24afaf60fa36bad799d5e296d6 -> cargo-c-0.10.4-46bd413.tar.gz
https://distfiles.macaronios.org/ae/b3/51/aeb3518426112d11da810197aa6b0c8ee991dceaea035b91ed3150a4ead93f5f41f252f7ee1b142798f3efdc4e7472757bea42ae8356b11159fab4d7b3dbdd71 -> cargo-c-0.10.4-funtoo-crates-bundle-123a342daa6a577cacfbbecba673981755a472b9d37ce721fd99e81a7afd183cb5200efb24241096d7ab0047d43623d18619d1940b1c4d3f3f1ef80eaf1d2adb.tar.gz"

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