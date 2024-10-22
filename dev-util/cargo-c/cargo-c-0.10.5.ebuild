# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/b6081a47813aab0175645e332b14282c651c893d -> cargo-c-0.10.5-b6081a4.tar.gz
https://distfiles.macaronios.org/1c/db/c1/1cdbc1602e2366b9dcdd78a85b16b4f2dc3713f2d7500df68dc3230549e9a6b645f9a916715f52694daaa6c59161b36bd297fc757930faaedd25d3270c126d71 -> cargo-c-0.10.5-funtoo-crates-bundle-c4cd0e85ee2322497a279dfb81aeb364c5633558906fd5d9131c28d37ae1b2599865dcd54eb2e910b7b5ab2dac5bb77f3c2a06babdbddf2e75196da129f6f9e3.tar.gz"

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