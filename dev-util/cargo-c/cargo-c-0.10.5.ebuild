# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/b6081a47813aab0175645e332b14282c651c893d -> cargo-c-0.10.5-b6081a4.tar.gz
https://distfiles.macaronios.org/f3/76/34/f37634278efa5c707feaafb1dd6afc37e5a8323e06a3001278680729413ea963cf6132117db562f6cb46cabfd6c094337555eb95bcbdb14f8f65228baf16544e -> cargo-c-0.10.5-funtoo-crates-bundle-74adc690d3fd5f5f03ee5bfaa56fba9ccac039b70f7c4f5d15fd86d55a3fc9abc9adde2c973ffae06f885a4c9f096b319855c605daa4708c30ab9227204e2119.tar.gz"

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