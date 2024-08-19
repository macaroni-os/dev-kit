# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A modern ls with a lot of pretty colors and awesome icons"
HOMEPAGE="https://github.com/lsd-rs/lsd"
SRC_URI="https://github.com/lsd-rs/lsd/tarball/a7fce648acb87a6a85be9b4fa9c2270600a8a50d -> lsd-1.1.3-a7fce64.tar.gz
https://distfiles.macaronios.org/4d/61/98/4d6198eb231bf93d2f1f05fdbb0cc18755edb12dad96755c59b12bbd719a0b10fe8a8cfc6d175bfe6deb63cbcec3d816a072096be390ec8c1e8f448f6e9dcbcf -> lsd-1.1.3-funtoo-crates-bundle-038f5c9405aabedffd7bca2c1c67b3fe500f05a3a6e9e8bb660778f84d4e751bb70cfb981775e459ec0099d7bb6af9774f5c81fbee30d8ed557f0eb21c57bfcc.tar.gz"

LICENSE="Apache-2.0 Boost-1.0 BSD BSD-2 CC0-1.0 ISC LGPL-3+ MIT Apache-2.0 Unlicense ZLIB"
SLOT="0"
KEYWORDS="*"
IUSE="+git"

DEPEND=""
RDEPEND=""
BDEPEND=">=virtual/rust-1.31.0"

QA_FLAGS_IGNORED="/usr/bin/lsd"

src_unpack() {
	cargo_src_unpack
	rm -rf ${S}
	mv ${WORKDIR}/lsd-rs-lsd-* ${S} || die
}

src_install() {
	cargo_src_install
	einstalldocs
}