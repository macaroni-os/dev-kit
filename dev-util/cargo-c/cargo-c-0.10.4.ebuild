# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/46bd413718501a24afaf60fa36bad799d5e296d6 -> cargo-c-0.10.4-46bd413.tar.gz
https://distfiles.macaronios.org/f1/d0/59/f1d0594022c35330200ee08283f73a4949786942895270dd6c009b7d514a0a9f1b20e7aede445818074cd7f63b7d7ab8ce6ac86e0a77b3713fe12019e1f319ca -> cargo-c-0.10.4-funtoo-crates-bundle-58e8ade6662806fa638daad84444f43785ddbcc9cd661bb0f1951a25d2427233cb522b633feca8d8b4e0dbfb95612f39176b9c2c66520e5d307307909ba87357.tar.gz"

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