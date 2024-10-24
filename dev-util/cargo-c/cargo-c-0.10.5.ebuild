# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/b6081a47813aab0175645e332b14282c651c893d -> cargo-c-0.10.5-b6081a4.tar.gz
https://distfiles.macaronios.org/ca/2a/01/ca2a01c2f234d27d40deef3d446728e3e37f112c8f3b985746c6d0c7dbde22676649df773e5f7bc373178c968a1599bf0362d7233a723dc51b55cdc63ecbbda2 -> cargo-c-0.10.5-funtoo-crates-bundle-88a3911cb1e40729de16eb7d9db1dc16a607c6afccf30a29f7b1df7a2e24974b9eac405a6cfae47a5cd426f5d9581f5a5153b9a4e2a2574063c51f142855da65.tar.gz"

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