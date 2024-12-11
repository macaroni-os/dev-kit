# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/8914ddfa8d45a0c27abdb48708138a5bc32e5bd6 -> cargo-c-0.10.7-8914ddf.tar.gz
https://distfiles.macaronios.org/31/31/de/3131dec49302d4159f999370e66cc6e0bb8be0ca83707382ab4e8a2fbdfc927dad5e709d712baef82cd93cbf27896799ebdb0257b5cf92ad80a33f6a82cb7b84 -> cargo-c-0.10.7-funtoo-crates-bundle-8eaa1e12392e00b498ffefe11ca8d59f702f2df069531415adf5f94261e57e34b42e6e7d3291f1c584ea940650a71608174e54b09edcd3b89919e372156a95e0.tar.gz"

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