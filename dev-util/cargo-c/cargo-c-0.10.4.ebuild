# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/46bd413718501a24afaf60fa36bad799d5e296d6 -> cargo-c-0.10.4-46bd413.tar.gz
https://distfiles.macaronios.org/96/b8/d8/96b8d8cb89a740188d8f84bfd0cd0414d6917c9b0a3395218171107484e96758183fbac172d4f6acec67cf172dd432c57d6f6616206e4eb1e8f3d8e890a47be1 -> cargo-c-0.10.4-funtoo-crates-bundle-ec797d932fd71b42c625839402c1bd39b4be2786c67632bf944303d15fc6a13d6f4ea6bee07cff2cd9e83c801401dde1354149a42936eb97698c97a29796cd47.tar.gz"

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