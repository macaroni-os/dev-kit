# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/b6081a47813aab0175645e332b14282c651c893d -> cargo-c-0.10.5-b6081a4.tar.gz
https://distfiles.macaronios.org/14/9f/a2/149fa2fdc2f1f946f316c1956680753b521e35f9c719aec2c9f5715df5aafd09e15fb1b6cb660e85629c39d8da8d5d4e60c4cb56755cff158afd9240ab5fb984 -> cargo-c-0.10.5-funtoo-crates-bundle-48fd3d1159947bab44a1c453a015cb17f8eb5cdbfb5a242d1ade5d462ddac0fa5f7cd868a373166619a93654613a5994f06cd91b96758ab7a6a65e5a807224eb.tar.gz"

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