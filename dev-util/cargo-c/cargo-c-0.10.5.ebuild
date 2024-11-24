# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/b6081a47813aab0175645e332b14282c651c893d -> cargo-c-0.10.5-b6081a4.tar.gz
https://distfiles.macaronios.org/ac/2e/63/ac2e6350a197d8419466c53950304259f9cc43b92dd7aee241f21605b3581c3fa0a8370242a332f13f80ee0414477d298a0abab70fb0b2da08d943ff36cbeee0 -> cargo-c-0.10.5-funtoo-crates-bundle-544e013585015907bb922e3e12b8fdc291fa60d9826ad659cedc3345c86642baf8dfbb5eecf2969c0e3fac76a01e7b37c1ddd81ca5c547b1ae19acf5faf897e3.tar.gz"

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