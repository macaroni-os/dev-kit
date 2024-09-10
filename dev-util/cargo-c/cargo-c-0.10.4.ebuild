# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/46bd413718501a24afaf60fa36bad799d5e296d6 -> cargo-c-0.10.4-46bd413.tar.gz
https://distfiles.macaronios.org/2a/dd/fb/2addfbe7eb072ab77fb04ddb80df927c38108d9e100a9fe044dd1ed36a424c0ee328ec5dc1acb23789f40661d8acc171400713a4cf8bab306548688e8f78fffe -> cargo-c-0.10.4-funtoo-crates-bundle-ccfb8a23503169b99253085d840f4335d8e62813df1cf2f46482b4625d9e4e0f91c0c9b414341b3e2a4ae95409a7722d4bc6d614dbdd193ba054ce92c2b33adf.tar.gz"

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