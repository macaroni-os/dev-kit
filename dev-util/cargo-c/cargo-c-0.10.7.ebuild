# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/8914ddfa8d45a0c27abdb48708138a5bc32e5bd6 -> cargo-c-0.10.7-8914ddf.tar.gz
https://distfiles.macaronios.org/9e/09/5f/9e095f126586fdefe506f5924a5c88de8ce37c63a351afbead3ce15c42043e41559fd9bd6a3a25e1fa92fbaba2d09342fe4daa5dd66d3013085cb737bad5176a -> cargo-c-0.10.7-funtoo-crates-bundle-5b304d2d03b609f25628eefafc28172cbabbf65fc2f070cdbe7357f9869879ff444a9fb2429e9c9fe15fc99c20deb53d7db202a3ed695b577815109df6fd0ba5.tar.gz"

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