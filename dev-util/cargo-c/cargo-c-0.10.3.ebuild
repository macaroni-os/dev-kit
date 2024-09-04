# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/ee7d7ef74b9c1fa00c6780da41a838752c76b3eb -> cargo-c-0.10.3-ee7d7ef.tar.gz
https://distfiles.macaronios.org/11/bb/b4/11bbb43a9d14a494e5752e2256422d0ccb4b9a0d0d2c006d407cefa673dacf8822632fd89c8f6b0b526db49152b52167400c6374a84ecc1e2416a8baa806bd97 -> cargo-c-0.10.3-funtoo-crates-bundle-541cc7953436f3b4945c44cfce8dd86ecbb6d185a0c4b74193c87caae00dc4dd762d2487d91e7cc923c1e92cffee4ae7cf48a6fabd70e92493ad2db500256997.tar.gz"

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