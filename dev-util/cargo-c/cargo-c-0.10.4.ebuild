# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/46bd413718501a24afaf60fa36bad799d5e296d6 -> cargo-c-0.10.4-46bd413.tar.gz
https://distfiles.macaronios.org/28/49/f6/2849f6ad4a5a97340ddb4bdf5f30467011d07c16d165f27a24347a0c14e8cc5dfdde7a04be9d905b82b7a7fcff4c7ffc918885dc9e706002bedf610dafb9d5d9 -> cargo-c-0.10.4-funtoo-crates-bundle-7e8ffe83347e53aefa89b38a8adab3728cd896018e8fb535ac8a8e6fec88ab16d59cf7834d23e7673685d3ab5eba3815dee87f409b3995e5ce8399362d7a4f4f.tar.gz"

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