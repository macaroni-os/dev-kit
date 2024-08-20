# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/ee7d7ef74b9c1fa00c6780da41a838752c76b3eb -> cargo-c-0.10.3-ee7d7ef.tar.gz
https://distfiles.macaronios.org/ce/6d/2c/ce6d2cdcb484a033b2441c60f212e526f9afba74258c15973d4189c21b8590b4d671aaf2dbaa82d9a31e5161e64e7c96d69a217d88ad11c39e8ed098c7f867af -> cargo-c-0.10.3-funtoo-crates-bundle-c56d9926dfabb15f2cc7877551f8b913792e6b0fe799eb3bd514fd56139cb9363c6904ca652c995437225cccdbc4289fc782e1473ac373b1021b39d9f3ebde6a.tar.gz"

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