# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/13cdea00f92fbd69ebf6f342aac5622700c9e691 -> cargo-c-0.10.13-13cdea0.tar.gz
https://distfiles.macaronios.org/6c/bf/c8/6cbfc87e3102eab8ac46e6acaee9a03b0c6eb2c0a05efd8b897cac1ebbf66589ce0fadd0f474e74fe8de32495447c005743396066e0546461096a0a446a882ed -> cargo-c-0.10.13-funtoo-crates-bundle-11358e407654753476d6bd020352b1b27ec40127e55b838623c67f290ffda4a68068c6f1d35e0e5e4089993d515948713ba57d35c0d65c9e7dd60810daa3663b.tar.gz"

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