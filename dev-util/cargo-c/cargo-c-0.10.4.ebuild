# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/46bd413718501a24afaf60fa36bad799d5e296d6 -> cargo-c-0.10.4-46bd413.tar.gz
https://distfiles.macaronios.org/52/3e/e5/523ee59d54cb8dad0c7e65b6c5ccfc3b32ab77885ee70fb8d9f48126359fddfca6958007a6045125f89d7bfed38423b8151e809164efddf012901ac43ed4f1d2 -> cargo-c-0.10.4-funtoo-crates-bundle-9a129c4bf2ec0441366bf4cc7e48c9426f0d89e4324bea7946a709e018248c1cace359ed327a82562f0990cfa497406e327d78a9046824f21d991e63ca336908.tar.gz"

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