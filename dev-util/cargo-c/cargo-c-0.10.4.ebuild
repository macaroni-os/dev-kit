# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/46bd413718501a24afaf60fa36bad799d5e296d6 -> cargo-c-0.10.4-46bd413.tar.gz
https://distfiles.macaronios.org/18/61/67/18616704df6dc35389bc5222fdd4066b8d11c854deb27967c9bca389903053340522d9ae3efc83ff8aa8b11a1c7e1de46b48536a1f9cd4c683a99b6716ef260c -> cargo-c-0.10.4-funtoo-crates-bundle-85dda0cedf7f774bfaab027030d4527c661e1b9fe1924ff7cec4fdf4af29d5c8f3bd23af491469d1c32f2a490833c06a81e0200ba1a2d7ec3ee109f9acf766bc.tar.gz"

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