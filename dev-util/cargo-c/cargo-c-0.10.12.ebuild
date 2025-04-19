# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/8c5b7af3d6edb6d99f7bffcc94adf550cfee65b3 -> cargo-c-0.10.12-8c5b7af.tar.gz
https://distfiles.macaronios.org/97/b3/87/97b3878f6ac02187f2f942b8bb583fa9e590064938d45384f4f16893aab304234a55ced0f42a1afe3c6999ef05a9869217d0495a066ca1d3111050e373114af5 -> cargo-c-0.10.12-funtoo-crates-bundle-57c2c4218ce683690d7097149c252dcf1582c04d964c54401637db7ded2fdcacfb54af90a9654cf82bdab9fdbfc273aec899ab10fc7824880193a1bac2e42116.tar.gz"

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