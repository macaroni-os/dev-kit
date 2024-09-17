# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/46bd413718501a24afaf60fa36bad799d5e296d6 -> cargo-c-0.10.4-46bd413.tar.gz
https://distfiles.macaronios.org/56/fa/b5/56fab55d8d6961e1ff2cb916d8a5c0b1615b7f894812064dc181a68d52a8048c4d0e4c2d614dae8d72b991c113efb2703a7c99c138766d615bebdad8fb4a39ec -> cargo-c-0.10.4-funtoo-crates-bundle-04dc489137d1b7406991c019f84ffc3967de550161c378853d4aca170d00dd668a8025eb15885f8414fb5ced990adefc665a9709762c070591f53452da0eca33.tar.gz"

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