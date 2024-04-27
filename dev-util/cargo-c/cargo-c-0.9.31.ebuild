# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/b140d7ca93d0ca734552866b205ac525fb13c67d -> cargo-c-0.9.31-b140d7c.tar.gz
https://direct.funtoo.org/c9/90/55/c99055297b56ba2be5970ecb97a4e774cc4f29ba3e97475c3e35609c35a4dbf64b50605979fb7a39759e16c073237bb83ca84455d7bec03ef48d3437bc9ad54f -> cargo-c-0.9.31-funtoo-crates-bundle-03fb40980b371be8ba765e1cd5ca82986feaafe25a64df676c83a32a09dc55ac08ef55e56163bde16299bb41b00dbda0d1c517ab44cf36be1f51751cbdffbf64.tar.gz"

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