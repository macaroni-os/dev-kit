# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/b6081a47813aab0175645e332b14282c651c893d -> cargo-c-0.10.5-b6081a4.tar.gz
https://distfiles.macaronios.org/bc/ce/15/bcce15f161fd315fc3741f3ac0cfee0ccb9b811145c7c77840cde73fedb6e9b96d2a386da0ead1e4bfbbb16af22ad1167393f14817f124fb1a4c8813a253d7ca -> cargo-c-0.10.5-funtoo-crates-bundle-5e4dba6b8c031466f75fcbcb58bc757b7ecf6d3765385b834eb28b4b5d5ec7f183df8e52904a846054f6db3e60d2e13e26a5c3b7fc9c05cb57727e193103e2d1.tar.gz"

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