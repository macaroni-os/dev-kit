# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/b6081a47813aab0175645e332b14282c651c893d -> cargo-c-0.10.5-b6081a4.tar.gz
https://distfiles.macaronios.org/a8/76/54/a87654dd685e05373aaf997c2fad20632bc651e4c33196917cc57cfe1a4b97e9880fb14a5e3cc94a4ef2020c73edc955d58a74e798dba480fa4bdf629d530c9a -> cargo-c-0.10.5-funtoo-crates-bundle-1503bd5285621b47062f83d4dd8ea61fe76ccfce3e8abbacb642e831df9a9581ca21c89254934c7f37a7c824b42956bc39dcbaba5040ea114cade46ae62e50bc.tar.gz"

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