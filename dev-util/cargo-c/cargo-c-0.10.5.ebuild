# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/b6081a47813aab0175645e332b14282c651c893d -> cargo-c-0.10.5-b6081a4.tar.gz
https://distfiles.macaronios.org/ef/dc/49/efdc49ba4e2724b8bb8d49999086a3c4b27a354250307fdfcd438fba21305e1f805b471847baf77e8fa79f9719561ee47595e19f7697f6c5ee402f82920c4b62 -> cargo-c-0.10.5-funtoo-crates-bundle-aabe79a3f5cc653edef93b1879e3958b385b0ab4ae22b382aced7aa01cde35b933a552decc35942b278933a0b15f61faa6e1dcedecf91aa60b769f0327f35c78.tar.gz"

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