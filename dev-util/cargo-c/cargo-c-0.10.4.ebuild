# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/46bd413718501a24afaf60fa36bad799d5e296d6 -> cargo-c-0.10.4-46bd413.tar.gz
https://distfiles.macaronios.org/4a/99/bc/4a99bc4fa3a3f868064100dc6cee6f065b83c44bd424e354e6cadc499944be35ed47d61d23c1cf7ed1d35d0770deb8e3268817788c3c7f703869287a67c2763c -> cargo-c-0.10.4-funtoo-crates-bundle-d17239abc94d613ae34d0d764c0ef303443e471eeea1e7fe0e75b33e68068039c2a02f10471ebd605576ccb6455e00aa2bbe752381753b70ab19952ba6c13302.tar.gz"

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