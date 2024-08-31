# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/ee7d7ef74b9c1fa00c6780da41a838752c76b3eb -> cargo-c-0.10.3-ee7d7ef.tar.gz
https://distfiles.macaronios.org/af/78/5f/af785f7d597f3cefe2f4a3ea3f48668e758d72245abb36a7619c3e08d7cb338fd912daa8c1e9aa500144d9f67345be3e1116dc51da5134b020bdfed9bd8d7c5d -> cargo-c-0.10.3-funtoo-crates-bundle-66fe49bb001bd987eb58f360e23244e489ea4695e1ebb2c3a7c0b347c8bdec84d515fd8590bdc2455c7dcb810a4c854dd233e6ed36adc983139ea3aeddd1bd68.tar.gz"

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