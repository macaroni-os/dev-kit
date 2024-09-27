# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/46bd413718501a24afaf60fa36bad799d5e296d6 -> cargo-c-0.10.4-46bd413.tar.gz
https://distfiles.macaronios.org/d8/96/b8/d896b8df9c437cc22cf7e9090a74d75f36d533bdb589f17fdebbb043faf877978688a1933ee8c63fc379b5b76bebc317923ec5cf2ac6e49f8dfeca23557d65e8 -> cargo-c-0.10.4-funtoo-crates-bundle-ad15391ecdc9fcc56f20bbfac9960f329cfe11a6a62514c4131875b3b68d8e18310ceaed968552324696fb6c2b4d49478f3ac9ef2c91dde9bbc9a245ece9ea8c.tar.gz"

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