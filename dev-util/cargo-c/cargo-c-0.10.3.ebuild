# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/ee7d7ef74b9c1fa00c6780da41a838752c76b3eb -> cargo-c-0.10.3-ee7d7ef.tar.gz
https://distfiles.macaronios.org/9d/c8/62/9dc862517c2a0ce580abf58197a752f98a9d46042faa95a5f3436a395a4df86fe18cf313926a01af9d453e8f137ea47d34a2a4b27666cd20a93450285e4cf8cd -> cargo-c-0.10.3-funtoo-crates-bundle-8889f812268b133ab5dab5dd25cc5e462db662f5bd06d5e0716382e5693d221a82aff3d888bf04f0f623b15e988c4755dd9c00e5e6f097d71c7c9ff2cb0da8f1.tar.gz"

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