# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/46bd413718501a24afaf60fa36bad799d5e296d6 -> cargo-c-0.10.4-46bd413.tar.gz
https://distfiles.macaronios.org/6e/8d/44/6e8d446f40ffd30eefe3c700b45f750a60c5c5420f37d5701286cd73cde16fa536c3d903af5faa95bfead520654c0b45e5094fe7bb2009b16b78dcb036f4d40f -> cargo-c-0.10.4-funtoo-crates-bundle-873a13b5ee548154ef11d737ce6ce50c1128ecb3b33d831f1365104a150e9804fd57941e5e07a8320f2f2e1d4b071b38ad929c614b4a5cde98d942ef87300baf.tar.gz"

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