# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/46bd413718501a24afaf60fa36bad799d5e296d6 -> cargo-c-0.10.4-46bd413.tar.gz
https://distfiles.macaronios.org/09/39/73/093973615c4993d7001adb8ea0a101c48e7b0b092e1cf1d8c3257aab316eaa114d0e8ebdb80bca25f67d7dea804aa376903e7cd55c71b7522aca65d72c2d8516 -> cargo-c-0.10.4-funtoo-crates-bundle-2d0ae26107395d37dccb272df8cd9062dda6450cc350d89ac639a7f8c40fe22a62cf50e947854e44b38062b38cd169fc4374d50301ce6007baca1de319aa6b71.tar.gz"

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