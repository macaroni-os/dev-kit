# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/8914ddfa8d45a0c27abdb48708138a5bc32e5bd6 -> cargo-c-0.10.7-8914ddf.tar.gz
https://distfiles.macaronios.org/3b/b9/00/3bb900708fc0a927e111e33fdc7a1021ffc27cd7f10b363e3bbff73a464c551c51a78138a13ce4b7aa1391fb4a55adae2d066ee49957b066f17031ddc7552c18 -> cargo-c-0.10.7-funtoo-crates-bundle-32904ce93e8dff1c91eb401b929c13e52547ea55c5b187c2228033fc6ed91e98068fb0804beae61c1a893006323abf28b621f91f9880d319b26e94dd52bbffc7.tar.gz"

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