# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/8914ddfa8d45a0c27abdb48708138a5bc32e5bd6 -> cargo-c-0.10.7-8914ddf.tar.gz
https://distfiles.macaronios.org/94/13/ac/9413ac8ccda052e2cd03ea4abdff67187b68e8282f4e85303bca3190db87e48ad4de91574c06505defcfb64d65e5731157e57aaca47d647d34260cff48f279f6 -> cargo-c-0.10.7-funtoo-crates-bundle-565649ec41e6df6c95996480c9fcdab8b9584d533f43158dd0ef48ba477b11e2255aa2dc3bd5b1e34795e2fd420b322262519a05768bf15182966e36c225aeb0.tar.gz"

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