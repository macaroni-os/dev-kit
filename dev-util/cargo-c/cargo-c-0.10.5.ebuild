# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/b6081a47813aab0175645e332b14282c651c893d -> cargo-c-0.10.5-b6081a4.tar.gz
https://distfiles.macaronios.org/84/e2/60/84e260914bf260da44fae19f00e300ec4d6c0c14b725645b13b5bf2ca74a34ec509c26aff4a9d83027f2908f8db30295317281bc43019460e42d3fd5443331cf -> cargo-c-0.10.5-funtoo-crates-bundle-864823654bdceb8a64af5423b4a139fab38c1398332d502d0060123fbc1d2f7f8ececde4971b2d6a0cdc4844bd6129d97ba488cf547b6c57290efb9f93d38912.tar.gz"

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