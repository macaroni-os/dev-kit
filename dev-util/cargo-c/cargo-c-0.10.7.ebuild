# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/8914ddfa8d45a0c27abdb48708138a5bc32e5bd6 -> cargo-c-0.10.7-8914ddf.tar.gz
https://distfiles.macaronios.org/b0/75/db/b075db7e346c3895028634a5506cc99665241cef1edcad76724d7056939a11dd4b07ed4984ff69bb74c5616e609dee0caff71f4d851fce113065f1b16bd44e21 -> cargo-c-0.10.7-funtoo-crates-bundle-c5bcd14af602f1efa2b921f3e2e7d07b2b49893ad358aa45b39d4cc6a5e827536f6e6b37791ca4ba1c732c071cc1be10b0387698faaf701ca64eccfd90be5f08.tar.gz"

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