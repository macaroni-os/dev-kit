# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/ee7d7ef74b9c1fa00c6780da41a838752c76b3eb -> cargo-c-0.10.3-ee7d7ef.tar.gz
https://distfiles.macaronios.org/48/eb/cf/48ebcfc196d3a09e86ab1634398faf688d2b50b45d21f98b97525a13d4244a2ba67c5e329b8caa0ce27d3c32c97ea82763cfde1fecd0ef8094014216dc5082b6 -> cargo-c-0.10.3-funtoo-crates-bundle-9a0a08f73fda38da241b34792d8578a69c64050dc73b1129affd2ced77c1b20cd2ad24e49a7078e9bf1b747b5898975bcfb0c4fd0596490e684da435739d27ad.tar.gz"

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