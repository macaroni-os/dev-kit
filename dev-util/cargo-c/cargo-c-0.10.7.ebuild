# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/8914ddfa8d45a0c27abdb48708138a5bc32e5bd6 -> cargo-c-0.10.7-8914ddf.tar.gz
https://distfiles.macaronios.org/c0/40/34/c0403420a476d931bd6417a83c7c927f76f08baf15bbd8933e6bd69bc334384a6eba704d0693937df7b8f2cdbce6f0e23da3ab041203a028408eec97bcf703b5 -> cargo-c-0.10.7-funtoo-crates-bundle-407ed45626956b4661a4354aad7c0c2e128bc0301caa62c9da7805ae3a4da53ecc6fa203de33abd6f670924139707ade16d02a7aef5bb731dd934fc858a48842.tar.gz"

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