# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/8914ddfa8d45a0c27abdb48708138a5bc32e5bd6 -> cargo-c-0.10.7-8914ddf.tar.gz
https://distfiles.macaronios.org/5b/09/3a/5b093accef3656ab84fa0517c0be43a43d9c39e69855e2244188ac3c66a0187065863e2dd058c9d1ad9d2e5d88b8bb3ab96b40a3958f7104f951536127d31c47 -> cargo-c-0.10.7-funtoo-crates-bundle-0ecac3dd9dc177c05535e2e4e042300224d8e7f6737d1d0fd68605246246968f8aceb403d437341c14a4fce3d11e8fdb283a91527459f9a9c54648feb4762adf.tar.gz"

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