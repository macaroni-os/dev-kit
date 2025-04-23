# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/8c5b7af3d6edb6d99f7bffcc94adf550cfee65b3 -> cargo-c-0.10.12-8c5b7af.tar.gz
https://distfiles.macaronios.org/c2/b6/49/c2b64959f3bfb595225efacef818b2d0afa3d35fe0dc44406824bd2d8ae62631887db42f653345ff0e45a6d5829349b948a92d1600c47d35becea5fdf85284b2 -> cargo-c-0.10.12-funtoo-crates-bundle-63864fc9a553f989779df7d258c43cc5b4436798534f2c720e7fdebfeb7fc704ae6ec0e03a48d6902d35030bc8ad93389ef21a89258fc04930aaa0661658561a.tar.gz"

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