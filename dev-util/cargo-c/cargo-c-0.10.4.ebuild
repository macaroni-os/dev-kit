# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/46bd413718501a24afaf60fa36bad799d5e296d6 -> cargo-c-0.10.4-46bd413.tar.gz
https://distfiles.macaronios.org/a9/7b/3d/a97b3ddb6f7884e1429bf10b8a0be1c880946df23761094d4c0569d27fb3cfceee5d9ac0fd73dcab4fa508fde84f60f5c26d304e5f07cd2c45a39e70bc61aad0 -> cargo-c-0.10.4-funtoo-crates-bundle-1545d9eef66111314a0c791fd4f70f59b562f14c2fea4ecba925156a6ca4b339adc551c340132d8eaadaa76a27769800ba82b4b675b01fcd1fee690370e232f6.tar.gz"

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