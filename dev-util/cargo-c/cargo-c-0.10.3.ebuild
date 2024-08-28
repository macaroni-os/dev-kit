# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/ee7d7ef74b9c1fa00c6780da41a838752c76b3eb -> cargo-c-0.10.3-ee7d7ef.tar.gz
https://distfiles.macaronios.org/ba/14/91/ba149199e928b0a38636acbb6e8df03fe37f9cc22a296f63efd350be2013f0a3510c41e501633263ecb8b784675fc8393cf2e78d9afc12ee8c5b53d4d6346963 -> cargo-c-0.10.3-funtoo-crates-bundle-130321c2ebff398ad116e2c29733c76d32d6f11ce97e39954724008d0aa6b7db9b19f8e929ef6488931ab7b1dd240530238ab3272a67b92c26d99743785d43b6.tar.gz"

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