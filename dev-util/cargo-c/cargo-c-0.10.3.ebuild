# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/ee7d7ef74b9c1fa00c6780da41a838752c76b3eb -> cargo-c-0.10.3-ee7d7ef.tar.gz
https://distfiles.macaronios.org/bd/dd/93/bddd93bc10aea09c9518a7ed828510167f8dd592cbbd0f33791b582a8a10c7aff0379cf4dd764d16b8c41af5165904796c2c13a401c78c303c98f5b7f1c6ba47 -> cargo-c-0.10.3-funtoo-crates-bundle-bbdc3713c3b26822feff4d3a0799e157360dbf2fb7ea06a00837073fac718d1576ca9b7c507d19e5aa718a1846f702c33192bad983fcd78b32a89354d0024560.tar.gz"

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