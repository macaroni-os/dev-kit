# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/46bd413718501a24afaf60fa36bad799d5e296d6 -> cargo-c-0.10.4-46bd413.tar.gz
https://distfiles.macaronios.org/d4/c9/08/d4c908b3c99bccb290c803b4740d1ecc97150c45e3c3076e1e10b168d64f183919b90ef8b422c999ae20c385d3fe4860baaa46d6faf0acc8f49a8760e00fb27d -> cargo-c-0.10.4-funtoo-crates-bundle-d17239abc94d613ae34d0d764c0ef303443e471eeea1e7fe0e75b33e68068039c2a02f10471ebd605576ccb6455e00aa2bbe752381753b70ab19952ba6c13302.tar.gz"

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