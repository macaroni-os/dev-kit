# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/578b4ed8a8baa9faa42a072ca40b7267b125fc15 -> cargo-c-0.10.9-578b4ed.tar.gz
https://distfiles.macaronios.org/73/9f/d6/739fd654677f659245c57daf50f70401d8f2a445b300b7f4ad2a8aaf987ab3c321e21737d299782583e18e4fdc2d633529ec72a500dd9ad5f845b85e45c9cf64 -> cargo-c-0.10.9-funtoo-crates-bundle-fef1f67e7e7acf0ce5a5dab43d0febe58362b0e57ee69b3f2cfc9b398fb9976a1f3a972aad034510569be806e4f5045eedad24a0aefd8ead416e4ceb96bb9018.tar.gz"

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