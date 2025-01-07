# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/8914ddfa8d45a0c27abdb48708138a5bc32e5bd6 -> cargo-c-0.10.7-8914ddf.tar.gz
https://distfiles.macaronios.org/0e/12/16/0e12165ed07597be881b1d43e4d0e398f166ea487edcb75ccfc5d534b0135a1766fff6ad8aa423f3c6180d5dc447d1468628c1dcf6760e811e33e80d9baabdec -> cargo-c-0.10.7-funtoo-crates-bundle-fc63483132d8fe5ab8dc44909ba34e2e668116d711b75daf09f6cfab4e7d4a62e4b68894561719f1323c876f29ceb4855ba728c8ecece093379c7ceaf27c77c1.tar.gz"

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