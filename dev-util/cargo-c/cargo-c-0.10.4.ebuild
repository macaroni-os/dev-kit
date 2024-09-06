# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/46bd413718501a24afaf60fa36bad799d5e296d6 -> cargo-c-0.10.4-46bd413.tar.gz
https://distfiles.macaronios.org/fa/43/94/fa439474261620e8c0ff4218e2f04ad2e849b8c7e51f3b794e613a904e6462c388978d71dd980ae2da0393f7faf6cc5b1b204ae49e80de559a087be49762090a -> cargo-c-0.10.4-funtoo-crates-bundle-0f65a87d724663a0a3fe3fd6442770c3a6e5de5bb402ce59c596c01ac6abd3c4d02a1b83bd3e8139672e035a1cd0fc3ea0f58dfc2e27d341936b3c3a5baafbf2.tar.gz"

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