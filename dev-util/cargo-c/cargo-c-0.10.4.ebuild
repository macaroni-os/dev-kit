# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/46bd413718501a24afaf60fa36bad799d5e296d6 -> cargo-c-0.10.4-46bd413.tar.gz
https://distfiles.macaronios.org/7c/73/5a/7c735a4b5fea489ca0f0c36930439550854f754b6c1cc6e390442b6275cbbcda98b0adead82b67e3946412b3727b7aac8e896355ee386baea0f690cf0ac59ab1 -> cargo-c-0.10.4-funtoo-crates-bundle-39f11a10d3567fd36103e1f56bececc9e685e04322090d0d0445d5ec50878c994fbab72846e639c0ae543651098eca80c996d3fb70928700cfaa629c7ae803be.tar.gz"

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