# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/8914ddfa8d45a0c27abdb48708138a5bc32e5bd6 -> cargo-c-0.10.7-8914ddf.tar.gz
https://distfiles.macaronios.org/bd/e6/d6/bde6d62dcf14d80e9109439dd3c8ca21f42d29c7a9c3e32e8fcb7bd00af952274de8ae3f9d703110dc822e252450e72645b4f91ec766a0fa4dc381cd2a3abe9b -> cargo-c-0.10.7-funtoo-crates-bundle-3163c84760c4a1bb9830d4562196918b2b8aee75df41ab35495868f4cc1fc40f355e4a6b5b0427bebcb1fcd0c19123fbf803d5ad379db57b349a82c1f7d1144b.tar.gz"

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