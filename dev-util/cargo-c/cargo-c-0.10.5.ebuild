# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/b6081a47813aab0175645e332b14282c651c893d -> cargo-c-0.10.5-b6081a4.tar.gz
https://distfiles.macaronios.org/ba/68/40/ba684065b0eadb8bca7fd08aa199867b3966ab4cc1bd1e9624db75ea5542d8290d702a9b2633363145fc0563463c2c7479543fc9a713b031519488e8c773253a -> cargo-c-0.10.5-funtoo-crates-bundle-21f09b75633600315f9ae0fc66d3c2d2d699ceffc64ca4801d69b72c5f14d02a674249da0cfe9ad40237d6c2e1ccb660a17c77d830fe1fa0fe9c304cdea7466d.tar.gz"

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