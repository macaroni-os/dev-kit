# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/b6081a47813aab0175645e332b14282c651c893d -> cargo-c-0.10.5-b6081a4.tar.gz
https://distfiles.macaronios.org/a5/fe/18/a5fe18f402e66c3ebb50149b2ab3fdd7516fde33f508f3f3dd8b12fae9a80d4d284ae2d0c4f45028032cbd8cb2a8e0a9b3175aff074c7c469191d32e9a7a4580 -> cargo-c-0.10.5-funtoo-crates-bundle-38a191ea61e3839f42bdff8de0d311e6e917a163d007e2214165039aa661aec479ed1b88e6bc7d0dd17e5b6784af14a8bfa443d6525fd9bb2aed422f29b84c0e.tar.gz"

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