# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/46bd413718501a24afaf60fa36bad799d5e296d6 -> cargo-c-0.10.4-46bd413.tar.gz
https://distfiles.macaronios.org/a6/5c/79/a65c797f9d0e64c515b1b2c17e1f1093d37f4ee4c83db3ac6143d2ebb1655d991c4452c4fcbb69d9492a5f89388f5b878d824138262ed6dc2df6ae9e92077263 -> cargo-c-0.10.4-funtoo-crates-bundle-5ee45f3825a0022f31c6f57f61c0dcbc8994a34a397afe20bdc541b32556dfcbd507d9269641f86629f5566a4aaaa9731c0ce6e12ee3725810ee38db6e038373.tar.gz"

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