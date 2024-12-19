# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/8914ddfa8d45a0c27abdb48708138a5bc32e5bd6 -> cargo-c-0.10.7-8914ddf.tar.gz
https://distfiles.macaronios.org/a1/4e/a6/a14ea6b078f1a203db48a27beebaf89ca81b983c4e7ef5fe663e5565a10632035f540fb668dd0b76d592317fe4cc6f193f136f3f9d144eb1bfd46fc0ef9a4f49 -> cargo-c-0.10.7-funtoo-crates-bundle-6c8595d5b9c43546e64c7b2722dd8a7f545a619a80ef3b7926c2d368daf5cd23b8c020c0fc7d7057e13a30503ed7044a5b74f8d57ef3634bfc0279cdb5ee1ed8.tar.gz"

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