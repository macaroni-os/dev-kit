# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="A modern ls with a lot of pretty colors and awesome icons"
HOMEPAGE="https://github.com/lsd-rs/lsd"
SRC_URI="https://github.com/lsd-rs/lsd/tarball/6953ecbfe20ffee2c1dd07b8b8ae562250f371cd -> lsd-1.1.3-6953ecb.tar.gz
https://distfiles.macaronios.org/36/cb/a2/36cba2b3f6eb355ab41bbf3614cb49e43d1d96c24b2cf45c67f157a1092e9dd21079be6718b8e15430aafc4fb0293d3967b7dbb7b6260893a7dfcfe424b4f8ff -> lsd-1.1.3-funtoo-crates-bundle-038f5c9405aabedffd7bca2c1c67b3fe500f05a3a6e9e8bb660778f84d4e751bb70cfb981775e459ec0099d7bb6af9774f5c81fbee30d8ed557f0eb21c57bfcc.tar.gz"

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