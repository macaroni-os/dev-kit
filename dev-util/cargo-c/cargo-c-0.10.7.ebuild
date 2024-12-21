# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/8914ddfa8d45a0c27abdb48708138a5bc32e5bd6 -> cargo-c-0.10.7-8914ddf.tar.gz
https://distfiles.macaronios.org/30/2b/a7/302ba7dd42febf1c11f5e15a9ddd2db5852700311abf263dee6e8e5be1668a4195d7a1eadd778fe0024e0f51a008fd939f3d4fcf10bb29ecb12be6f956e29ec3 -> cargo-c-0.10.7-funtoo-crates-bundle-7c9386a53b39a9d655a9a083283480318bea55a87326200c381624f0acd6e00bd968df3823dd534388d240f1de4a2280b16288d5e5f77cf9ecbb76e9207cfd45.tar.gz"

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