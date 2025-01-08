# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/8914ddfa8d45a0c27abdb48708138a5bc32e5bd6 -> cargo-c-0.10.7-8914ddf.tar.gz
https://distfiles.macaronios.org/33/ea/89/33ea89aadfca2044653a7db58206da3acf8f15d8209f2b97ef3c8f077353c8112bf61cfc00abfb6000ed10a47f7bae622b63c37e2fc03f4bdab5115faa5b2230 -> cargo-c-0.10.7-funtoo-crates-bundle-94b5e663e1bbf9347f0286e48ed227a3a3e66920f8b6f4fd6151425e40217b60306a1fa86ae02ff81c32db6bc2f32cabdb6a357e020ce67ec5f2115e26295d76.tar.gz"

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