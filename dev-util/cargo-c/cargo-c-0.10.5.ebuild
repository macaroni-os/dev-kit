# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/b6081a47813aab0175645e332b14282c651c893d -> cargo-c-0.10.5-b6081a4.tar.gz
https://distfiles.macaronios.org/38/5e/dd/385edd38174eebe6ba73965b838a9279960470e2c1fab428291e36d45bf8bc4b8473f0966d7027be93f8314b82fd4d5d2d20883f05a20c7a4896341b91231d38 -> cargo-c-0.10.5-funtoo-crates-bundle-75eb4802d68d38c7e29875c8c1eb883be28d7c922891de96381cfac7ff031656f392751d87430d69381574b6f81d360f8d480eee5679b35786b5f494e0439d38.tar.gz"

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