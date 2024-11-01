# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/b6081a47813aab0175645e332b14282c651c893d -> cargo-c-0.10.5-b6081a4.tar.gz
https://distfiles.macaronios.org/c9/17/b2/c917b227fc490b2132eaf14ca487ddefe0b2346931fd4b6810588d3d987f82ddb48d495bb1bf79fe3d8f5216c267f012b83f466d6c13fe8384728a0eef8cdc27 -> cargo-c-0.10.5-funtoo-crates-bundle-d0dfc8b031aa938894d69092afef0b57c2c6c2bf90fb0abcb2208a178475ed7b4e0b638563792db5d43a3914d454dda6ec78c22ebcb97f04c0030504f7331004.tar.gz"

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