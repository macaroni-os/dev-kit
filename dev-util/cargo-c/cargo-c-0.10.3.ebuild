# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/ee7d7ef74b9c1fa00c6780da41a838752c76b3eb -> cargo-c-0.10.3-ee7d7ef.tar.gz
https://distfiles.macaronios.org/ca/93/fb/ca93fbf56e3f119287609097e6b8d05a6d258673ce77521c44db9b86aa3d7221dd1335b2bf2dd7ba3fe97952ba7d122a993513cba5501fd7f3b97617abf88657 -> cargo-c-0.10.3-funtoo-crates-bundle-204664cface7f84809b7b19a4cd97e3f3c4d637fe4bc57995d56057a8b19ec24c0738dc4d4ea15c2cc0bac6e9538a2722bafb2dd0178f7a7f2238231058f2394.tar.gz"

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