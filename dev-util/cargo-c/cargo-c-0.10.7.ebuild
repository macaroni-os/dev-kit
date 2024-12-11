# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/8914ddfa8d45a0c27abdb48708138a5bc32e5bd6 -> cargo-c-0.10.7-8914ddf.tar.gz
https://distfiles.macaronios.org/3c/6b/12/3c6b1222dfa096733490e6c38d3f35e8eb1e26fd6a967d741e7f0aef61106cce98b6a119d947897ea9850b3b13ac1a409e79297006c9413bac3cf7ba11d5b2ef -> cargo-c-0.10.7-funtoo-crates-bundle-4c69bd8a658b39948f89577b764fe7a5f796fadaefce5cb699b46961bd850462af975768b601c4f3ab5518db1d6bbb8debb12ae7e82da381ddd00e7421f3ffa9.tar.gz"

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