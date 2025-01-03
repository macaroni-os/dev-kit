# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/8914ddfa8d45a0c27abdb48708138a5bc32e5bd6 -> cargo-c-0.10.7-8914ddf.tar.gz
https://distfiles.macaronios.org/98/b2/3a/98b23ac996dcb121b17426797d8e55cf8bfd319c293cde2300f34a59d5813f73c6b12917cc701eafd03835e3c889ca668f8441974d1eececa53a0274843ded4b -> cargo-c-0.10.7-funtoo-crates-bundle-f792dec1797b5088a74337f87b9955810250b004093c1b2b9bc32cdd5a9b4f4bfd3d405b5afe0391bf85cb64e329a0687de67c941e18725c65738e266b922d43.tar.gz"

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