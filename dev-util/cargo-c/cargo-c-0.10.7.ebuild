# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/8914ddfa8d45a0c27abdb48708138a5bc32e5bd6 -> cargo-c-0.10.7-8914ddf.tar.gz
https://distfiles.macaronios.org/9f/70/6f/9f706f031a70edac1b5f13d0ececc799cbcf0b235f52c3de2406eed45cb82d429f3381c8027315c806e9041cf18b0ab0a26702ac5de3fac04f15789ced6da5b6 -> cargo-c-0.10.7-funtoo-crates-bundle-a4299bf43c62b62ed49b3417ead242c5709b5a3a125f379124bcf499f59924bc105b85c072edfc77a5108dbf1a1db1e40f948b9a160415bcad08bbe886329175.tar.gz"

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