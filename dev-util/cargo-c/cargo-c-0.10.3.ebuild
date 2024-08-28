# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/ee7d7ef74b9c1fa00c6780da41a838752c76b3eb -> cargo-c-0.10.3-ee7d7ef.tar.gz
https://distfiles.macaronios.org/93/1d/11/931d115303a6fcab114dd52960fabdee745df05f3f7005a3a59428007595bbcc629f0000bf9d437b41e72a2f26a1cc2220738a80ab6173fe61f6ae94f6614773 -> cargo-c-0.10.3-funtoo-crates-bundle-130321c2ebff398ad116e2c29733c76d32d6f11ce97e39954724008d0aa6b7db9b19f8e929ef6488931ab7b1dd240530238ab3272a67b92c26d99743785d43b6.tar.gz"

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