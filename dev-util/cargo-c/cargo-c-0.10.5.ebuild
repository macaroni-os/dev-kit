# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/b6081a47813aab0175645e332b14282c651c893d -> cargo-c-0.10.5-b6081a4.tar.gz
https://distfiles.macaronios.org/57/e1/c5/57e1c59d7008cd1b1025a576076d1954d5bbd894977cd5e6c32bbe04273218cf2d9fac382c888ef49c99f399799db4ac515091b0817f73b071c62c0578204024 -> cargo-c-0.10.5-funtoo-crates-bundle-c97a3d4622f94e2bd258441b95bc6ba245c5ae19f423413929259203a23d6de229b5f8c8e0ed2515d6e9c5cb7d82f0c1f76f107130a6af7b6a46660997f8613d.tar.gz"

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