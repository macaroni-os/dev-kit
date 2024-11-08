# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/b6081a47813aab0175645e332b14282c651c893d -> cargo-c-0.10.5-b6081a4.tar.gz
https://distfiles.macaronios.org/e6/6b/df/e66bdf81b6b6af2f1f16d3b81015588159a557e8a1b5f5b0ffb81938349190e41bba4511c403401eb8a295eba449760c970778db096603c2228a20d7e1be0ec2 -> cargo-c-0.10.5-funtoo-crates-bundle-0ece30c6af26d8d3c769f6add916fc09a887fda298c4022799f238bff3fbe6d2b3328a44103e7ae9c998b628cf979fc1afa933091d2d452b55aef07fcb75bc20.tar.gz"

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