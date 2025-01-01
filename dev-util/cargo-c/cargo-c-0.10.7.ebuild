# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/8914ddfa8d45a0c27abdb48708138a5bc32e5bd6 -> cargo-c-0.10.7-8914ddf.tar.gz
https://distfiles.macaronios.org/e8/be/e8/e8bee8b89db24e9da3b8bda594aa7a93e944a95cccfd90303a9daa08b6f786eebade6bff243fa0e93ef5e8e22696961cce55d5955098ff08e429c6d65503eded -> cargo-c-0.10.7-funtoo-crates-bundle-0ccaa51d2094d0b55fa07172464dcf644c4a5e7d8146f69335f7ba1257b2c785fafb7f856f2344744670687c812c2aac89173635ccff8176eba8e9af181231f2.tar.gz"

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