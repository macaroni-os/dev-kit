# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/46bd413718501a24afaf60fa36bad799d5e296d6 -> cargo-c-0.10.4-46bd413.tar.gz
https://distfiles.macaronios.org/7e/87/4b/7e874b1c35f76dd743f1f4cc0789226d5c297a3864005a6f91dffa3100e242b50fee7b56c00cda11a74c8ce722fa552726c00c8f803a934c93bac33b772aae2d -> cargo-c-0.10.4-funtoo-crates-bundle-58e8ade6662806fa638daad84444f43785ddbcc9cd661bb0f1951a25d2427233cb522b633feca8d8b4e0dbfb95612f39176b9c2c66520e5d307307909ba87357.tar.gz"

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