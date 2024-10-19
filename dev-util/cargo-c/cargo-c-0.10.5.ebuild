# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/b6081a47813aab0175645e332b14282c651c893d -> cargo-c-0.10.5-b6081a4.tar.gz
https://distfiles.macaronios.org/fc/27/9a/fc279a0abd1e283fd7b3faf7a9968febf142d178e222c0c3881072b3be2247f589c0d9490dc64affeff95f898685a7e7c48a236575c139ad74c13981b0a13b2f -> cargo-c-0.10.5-funtoo-crates-bundle-92b3298d952fb772e8667564cc551b831ae0329b364b300a4eb30a12130f02fe555423d98a6287ccf80fc22211d3b66266f30976210848a8859191b200ec4084.tar.gz"

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