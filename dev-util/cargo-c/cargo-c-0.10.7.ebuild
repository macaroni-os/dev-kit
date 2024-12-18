# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/8914ddfa8d45a0c27abdb48708138a5bc32e5bd6 -> cargo-c-0.10.7-8914ddf.tar.gz
https://distfiles.macaronios.org/df/3f/c6/df3fc6aa740d72ededa86dfa8ba62c74618438a59faf82aa62f41103e4b5685690d0a1a8f73058c88c2d84e105e3b85cfb200166757fb759a59c250a64d7303d -> cargo-c-0.10.7-funtoo-crates-bundle-970e957baaeeadcdf9dfc14ea43281a093d98a1fabc449ce8203cef53edc84652fe0b8bbaba77d05117ea9c4e01d889cb31ffcccc88027f746c709e8e6772b90.tar.gz"

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