# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/b6081a47813aab0175645e332b14282c651c893d -> cargo-c-0.10.5-b6081a4.tar.gz
https://distfiles.macaronios.org/ad/a5/78/ada57873d679f28980ab9b0ebb6a18333a157b4eee9229f15ca51c48d0bdf0d4293840c59ff767a42eb63b3487c22174d5f4eec6a5c6ff6cea7832ffb96c312f -> cargo-c-0.10.5-funtoo-crates-bundle-b52a8fa22f80fb3e630daa6c30935122c427c0c721d4ff08a495b47bcba724a2001ffd859202195356951ebebe4979df23846ec42b1ba7814ccca34b73c84f4a.tar.gz"

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