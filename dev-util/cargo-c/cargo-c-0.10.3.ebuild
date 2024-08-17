# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/ee7d7ef74b9c1fa00c6780da41a838752c76b3eb -> cargo-c-0.10.3-ee7d7ef.tar.gz
https://distfiles.macaronios.org/31/e6/13/31e613a9f6a68ada5d2c4d3dddd535f5d32a0ae78e1711d66afa30a2881c8801e90a60317fc4a2cd43304e112a130e15d7a0aef82272aacd4af8e044a4485e15 -> cargo-c-0.10.3-funtoo-crates-bundle-84575a1fb83bfa6d71a6f726b3f3b3bc14dbdd00c83d4e0d65683ec9ab1d0a855ac14238062551adb01335539ae9544ecf37505c881148d18dd178c16b97eb5b.tar.gz"

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