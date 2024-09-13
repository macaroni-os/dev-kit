# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/46bd413718501a24afaf60fa36bad799d5e296d6 -> cargo-c-0.10.4-46bd413.tar.gz
https://distfiles.macaronios.org/02/c2/fa/02c2faae9b4b189e440b2bfd25a9921caa99408b5df5d7cbcfbf5bcb814fe154bc25cd6bd4697cfa178a40e3849c521d1630e1cb30dca7b984e7396eda489eb6 -> cargo-c-0.10.4-funtoo-crates-bundle-123a342daa6a577cacfbbecba673981755a472b9d37ce721fd99e81a7afd183cb5200efb24241096d7ab0047d43623d18619d1940b1c4d3f3f1ef80eaf1d2adb.tar.gz"

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