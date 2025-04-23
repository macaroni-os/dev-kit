# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/8c5b7af3d6edb6d99f7bffcc94adf550cfee65b3 -> cargo-c-0.10.12-8c5b7af.tar.gz
https://distfiles.macaronios.org/cc/4d/1b/cc4d1bdd540df88ee5465c4e07d70ea678927a94eb8a068826d47dd1da3decff36672d41597e1de8fbe276956f6d25c664528a91839a1bc5c7919d88b85f4c14 -> cargo-c-0.10.12-funtoo-crates-bundle-b628162c9815440f39faba64c73d5957b96740b9af44dbde6df392da7b1428189fb50fae2c7dd13a2c5abf7d86a48f71426ecbddc298e4ba7c9792a4368bf560.tar.gz"

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