# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/578b4ed8a8baa9faa42a072ca40b7267b125fc15 -> cargo-c-0.10.9-578b4ed.tar.gz
https://distfiles.macaronios.org/ec/5e/f7/ec5ef76eb40cbb96acbb6c6c07cd2c68655fa9ba7ac16acf29a9298281b83d0eae49e414f48920f5e9b7b21a3204d0e810e1c25a6a6ae560d1c97af7d7124223 -> cargo-c-0.10.9-funtoo-crates-bundle-cca1f973baceeb0b732f8ac10195fc9ded2ad6def612d215ef2b87607ea484b98cb4e701554587e404a7e3fccde9f870988b6d8d4852625334c7b0b0fb41648f.tar.gz"

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