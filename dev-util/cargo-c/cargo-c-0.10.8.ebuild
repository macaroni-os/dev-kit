# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/0d90bc5a47f2c37187545fe65efe37cc2f2647d7 -> cargo-c-0.10.8-0d90bc5.tar.gz
https://distfiles.macaronios.org/f3/d7/fa/f3d7fabce6a688b9f92feb97e177ca0d929a60a87dc221118c64609e7e47a51c1f78b477e4a6300c1a0eed489e8744f493fd564cc7d389d44dda89579281ea9b -> cargo-c-0.10.8-funtoo-crates-bundle-8937fd9428574a411943715d34383f1e4ba96bd853b1c4d3094cddb37ee9888e6efc4f498b4022867369e5d72748c23ef8c3e35408f770211bb049194d808ef2.tar.gz"

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