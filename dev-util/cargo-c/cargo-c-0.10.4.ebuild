# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/46bd413718501a24afaf60fa36bad799d5e296d6 -> cargo-c-0.10.4-46bd413.tar.gz
https://distfiles.macaronios.org/11/34/02/1134024d8c29c090af6004a2d2846fcf5d92b97d993bcd63a8757682e91ccea96365648f003938289887be35619f3ea6c8edf36b6be56141732e0c3f083c2efa -> cargo-c-0.10.4-funtoo-crates-bundle-7cc9798f02d78ff784dbaf883f096354ccb0ea3b75d5445f5ad8ff490f6f6979ebd2f259688342719a14176fd4db9e40025d05c6124f78d37606c5a83681029a.tar.gz"

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