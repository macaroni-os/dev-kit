# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/ee7d7ef74b9c1fa00c6780da41a838752c76b3eb -> cargo-c-0.10.3-ee7d7ef.tar.gz
https://distfiles.macaronios.org/5b/70/84/5b7084908ecae3d9ab4b7e7c10c755fef42179a53a9746aa6a493f60a9337c797a165fb73535c025d3c87627803ef0b0c82fb7f8884620baa313615147592a0c -> cargo-c-0.10.3-funtoo-crates-bundle-1d811759dd7730dc72a3fa81abb4f836d24bd603be8a0fd493bcae1e9a6b95a1295cc91d0cb6440b92b841b861e3064f594a8d729643edff40166493c97c209c.tar.gz"

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