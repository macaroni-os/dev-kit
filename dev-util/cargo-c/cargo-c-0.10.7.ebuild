# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/8914ddfa8d45a0c27abdb48708138a5bc32e5bd6 -> cargo-c-0.10.7-8914ddf.tar.gz
https://distfiles.macaronios.org/70/0f/b6/700fb676bd76ebf7309b679d78e78b8256b5d744cd26e875363069961943fd53dc6956a5ec73bee3365227456131fd2d6d613e13753fc819454af2d235a2e28f -> cargo-c-0.10.7-funtoo-crates-bundle-e9269aedf9589225b8d019fecb269cee1ecc6276eace40537c8f69b05110c9be02e8a7804b040fcaeb7df77bc5b49d34cab77886723269506c7df2d12b6b806c.tar.gz"

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