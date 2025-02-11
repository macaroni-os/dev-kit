# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/578b4ed8a8baa9faa42a072ca40b7267b125fc15 -> cargo-c-0.10.9-578b4ed.tar.gz
https://distfiles.macaronios.org/ff/de/3f/ffde3f7283e9ac070657c0f0008fa3e30dc84ea71ddc7dd3032ab8f93aab68b1e17aa024667e4a172e6b3bc42673957f3815ff980b4d97a264fb75a85b1058f5 -> cargo-c-0.10.9-funtoo-crates-bundle-614fa48a9a56b2b247ff144e97838938b93c741fd601dbf94a1f8d549e70afc73d248a55b3ae25260c6956d445b332324dfff778862e45940f612fb129cdb2fd.tar.gz"

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