# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/8914ddfa8d45a0c27abdb48708138a5bc32e5bd6 -> cargo-c-0.10.7-8914ddf.tar.gz
https://distfiles.macaronios.org/51/c3/8e/51c38ebb321c6e374362aac0ae7d5bbddc020c26e6274dc0aef063760bea8198a18e02a7c9551c2c923ef1defca2c63e0db846bba2ba8736654d24d7273ce741 -> cargo-c-0.10.7-funtoo-crates-bundle-40e42a10c5dd0e750376abeba947708da2b5a63fe85ecaa1c74cadaec1cc7a6e26e7053f7c4cef3ef0e3fb03f9248890b7d84df345154b92d2c14785c21be066.tar.gz"

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