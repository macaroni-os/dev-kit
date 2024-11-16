# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/b6081a47813aab0175645e332b14282c651c893d -> cargo-c-0.10.5-b6081a4.tar.gz
https://distfiles.macaronios.org/d0/e6/9a/d0e69ad10ae70ccdb3ba918385057912231ac33b94f696b6d3dcca25ec11967c651242fc747c0cbbe961924ca2f15675cd22a71c5474121f688aed25550b7ef6 -> cargo-c-0.10.5-funtoo-crates-bundle-29ae7bc9e06b1c6931c92df470d3952e0da2a574cb39077a2ce02af47985c9e2feaa401ba444ec49b5d56e54959d5277d13105301c9e1e7e9ec2123e0340081f.tar.gz"

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