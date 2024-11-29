# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/c027fcf597e10154a8bc55c46182a4c2480d8d25 -> cargo-c-0.10.6-c027fcf.tar.gz
https://distfiles.macaronios.org/b6/13/43/b61343283eb3c72482382d1e8d1247dbb91202cfc904ab3044f828d95addc628e9ad5d1e93e102b780cf9168406750caec7c3156d96fe47c9ba3229a6b3bb17d -> cargo-c-0.10.6-funtoo-crates-bundle-76d3ac15d0693877a5a80c2dadeba66c214e7643c6c10a03e784203d67b4c90397653ed96ff76f51e5c6144f8ee415d3646749b49f375287b9f7071acb3966ad.tar.gz"

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