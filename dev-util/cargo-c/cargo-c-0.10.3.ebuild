# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/ee7d7ef74b9c1fa00c6780da41a838752c76b3eb -> cargo-c-0.10.3-ee7d7ef.tar.gz
https://distfiles.macaronios.org/54/bb/16/54bb1698a5f2580529327e6f3285bd83641e2cef82741d5e3d68ffc623e1fc891f3e614ad2fb110a4ba68385aea2dad0329ab7964b5e34203912acd156d6c510 -> cargo-c-0.10.3-funtoo-crates-bundle-7dfaf51b509f26cb673d62db76a948625c35057fa0dea8a6742fee5d1bf5609c5885653b1311abd8abf50bf27170498b548987ad66147fd6e5a96409be720cba.tar.gz"

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