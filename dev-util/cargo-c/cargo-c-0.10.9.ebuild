# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/578b4ed8a8baa9faa42a072ca40b7267b125fc15 -> cargo-c-0.10.9-578b4ed.tar.gz
https://distfiles.macaronios.org/18/4e/41/184e41c99db5867229861150bf2438e604ada88e47935961e5ef779983265c8307305747b7d63d9e73cf9db039cb4ecd164ad0c63f1fc610a3b84ea6a5173f8d -> cargo-c-0.10.9-funtoo-crates-bundle-f9e4f3ae80a33b3ab4255c3eb9c5734f0cbf165f0c05d11923a30a38d3b13d69718834182d5aa4060582a00a5c134b4c342ea3522cdb94600c77028e2aee9a7b.tar.gz"

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