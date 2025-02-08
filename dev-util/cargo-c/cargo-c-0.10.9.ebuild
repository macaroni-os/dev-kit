# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/578b4ed8a8baa9faa42a072ca40b7267b125fc15 -> cargo-c-0.10.9-578b4ed.tar.gz
https://distfiles.macaronios.org/30/ce/07/30ce0771fbfd161985587312d0807b9f2c0d794ddbee7e4c20f2c1a414476da40ed2e75938693fc1f53436b993353d5303a33b7cb57337ed69b3b6437b9f4750 -> cargo-c-0.10.9-funtoo-crates-bundle-f7c150bd7d4335fa26263f5565064a2eac196523c9262a560776f86dcebd02b8f96a5c91ac0c02c508fe033810d2dfe03b987d02082f17ad1f3cfa19edf81b75.tar.gz"

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