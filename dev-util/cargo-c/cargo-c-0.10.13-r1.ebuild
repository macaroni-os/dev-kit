# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/13cdea00f92fbd69ebf6f342aac5622700c9e691 -> cargo-c-0.10.13-13cdea0.tar.gz
https://distfiles.macaronios.org/d7/e8/d6/d7e8d6c8967d23d608dd217b18e5ee3ca7cb6a31afc9f9cad4fb1fc0735cfda962f33f1dcb235ffd72fce388b08e66a325c412afee42ed4741a322d18718c33b -> cargo-c-0.10.13-funtoo-crates-bundle-1d929a06386525058a63f920151c90a156b879ab9befa3cf91d0206ca02a46d3417924b262f9d1c31ddd6d0c243ef070a49e803047b452268e276c186b820939.tar.gz"

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