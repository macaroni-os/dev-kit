# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/b6081a47813aab0175645e332b14282c651c893d -> cargo-c-0.10.5-b6081a4.tar.gz
https://distfiles.macaronios.org/f8/d8/b2/f8d8b276fd1a94c434ae2c2ee012edcb5ddd57000a8a76bfef7f96fef49245a1a57cea42a43d7d2b6e334db52f0db22de0a68cbb2d3d024fd39c29718142466e -> cargo-c-0.10.5-funtoo-crates-bundle-f1fc2b6752933c5bd62c38aaa8aa37b94765061df048d1fa438041be2401df9ead90b0b1fbe5b36b5aaea72181078e53834994ded876170d012ecc554af3a2bc.tar.gz"

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