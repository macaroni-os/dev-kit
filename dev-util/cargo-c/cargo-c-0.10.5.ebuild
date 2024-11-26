# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/b6081a47813aab0175645e332b14282c651c893d -> cargo-c-0.10.5-b6081a4.tar.gz
https://distfiles.macaronios.org/9d/24/e8/9d24e89024acb6416094911c4b06f6c636425495f0c187a5820e6a3e0333f67b3224959a73af0a40f38c7045d18b0366dc143c59ae474159849e18f7201b36fd -> cargo-c-0.10.5-funtoo-crates-bundle-2f3468f0562b9b78432e870f534330388302252bd08616e78c1c06c1cbbee29af6ad81d425ee25a18d9653a29bec70b9e246e5ef4ed90a5a5046dbfc82b655ed.tar.gz"

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