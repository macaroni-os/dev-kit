# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/c6da659efddf1ff1c6e7322f72654f018907cc2d -> cargo-c-0.10.11-c6da659.tar.gz
https://distfiles.macaronios.org/ed/f9/05/edf905c674dd4dd1ba9d3369ebd870024693f2a1eb6791932826a24467ce4705ab383e4b4b0b2bdffd7cd7e384da7baf02120889ae55d6205bf2ce04c7a0f061 -> cargo-c-0.10.11-funtoo-crates-bundle-a7f1045787ffed9bf0a72c2ed4c986739e0b06f4edcb783b3d41abb225cc2c6ec2fb0c4825e6f24eff024b690fcce16b51b227cfd0e797e956d936ccb7aaf1a1.tar.gz"

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