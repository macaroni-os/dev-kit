# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/8c5b7af3d6edb6d99f7bffcc94adf550cfee65b3 -> cargo-c-0.10.12-8c5b7af.tar.gz
https://distfiles.macaronios.org/60/26/83/602683a48f88f9da9469cdd3af6c72688a85e4dc6c38a68988a042c0ce32c1374588d93eaa98449f16ea895cc14ea4d9874f94674f906134ef679ce331baf8f8 -> cargo-c-0.10.12-funtoo-crates-bundle-061478dad5387a465328d7487cc146b21b68add55cd37967b7e55abe530d71469086d3a51c9f62b41c0b0c31288460cef2ce67ad9e41b39c944e3c14416d8803.tar.gz"

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