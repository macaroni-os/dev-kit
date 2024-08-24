# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/ee7d7ef74b9c1fa00c6780da41a838752c76b3eb -> cargo-c-0.10.3-ee7d7ef.tar.gz
https://distfiles.macaronios.org/93/9c/d1/939cd1f4170046221038d0738e36f8c36da40e85f0defabbd7901b16bc8f27c9314c6333549a5d8a8641a4d72ae362cd2737e72de5cd885e7e04aa330e8a2ea3 -> cargo-c-0.10.3-funtoo-crates-bundle-1d51d7a46df4d9cdb97caf957235cc6e6daa830b0d652c35c4c7bd1ad41519e60767ea26d4fb9fdfc411c1cd7a3df0f268ac1f1fa4f3f0c77e756b049236dde2.tar.gz"

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