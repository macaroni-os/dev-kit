# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/8914ddfa8d45a0c27abdb48708138a5bc32e5bd6 -> cargo-c-0.10.7-8914ddf.tar.gz
https://distfiles.macaronios.org/09/d0/fd/09d0fd90ec6b945f8d48c53eb0c7d7cfa67b20263b3897e3618ee8e02b93b08a8daed1d1a421769964c40a733a6068c98aad2bc2591001ff0527ce962f4dd442 -> cargo-c-0.10.7-funtoo-crates-bundle-ca090c25b3e550c74ba18aeb12bfe3c217d0b7e4d5cac649501dcfb1107708c563607cef58084e3475822c7d1336f070b111822a71e8d43a0025527872cace48.tar.gz"

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