# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/8914ddfa8d45a0c27abdb48708138a5bc32e5bd6 -> cargo-c-0.10.7-8914ddf.tar.gz
https://distfiles.macaronios.org/d5/d1/c6/d5d1c60cf17fd1c994faefed4691fa9230197627b0e27787bc9661eb18a88e48c0b49f224970f3a4320c52df301dfde471a8ea1db12896e32de32844fdae7c3c -> cargo-c-0.10.7-funtoo-crates-bundle-34617edddfacabcc37758cb2d6a5c3f288a0079a57429cd7ef4ae69015f7cd1729c0e1d316673871c3d483e03aacc470eff294bf5038176ea10c4308113ce2e4.tar.gz"

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