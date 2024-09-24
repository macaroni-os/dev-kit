# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/46bd413718501a24afaf60fa36bad799d5e296d6 -> cargo-c-0.10.4-46bd413.tar.gz
https://distfiles.macaronios.org/fb/26/d4/fb26d4ab7af9c3d22dd1a369840ddcfd1592277e6b046026db130f7e28d34d9217d964bf0a601dc417f248856d3dab4612553aec2d8dadc25c354b3316678412 -> cargo-c-0.10.4-funtoo-crates-bundle-b7eac84f0b17855df58d62d5fc101ffe65b8fd61c2da1f13bd50e9b33856f011b91fbbac0f97e7c73c54941c9fb24aea3bfb74efbb0bec35a81231067fd812e4.tar.gz"

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