# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/b6081a47813aab0175645e332b14282c651c893d -> cargo-c-0.10.5-b6081a4.tar.gz
https://distfiles.macaronios.org/c9/e6/04/c9e6041a1da141217ec3f5986444e207b8c86da6c15433aac9aa994d7a3aba620dafef1c0b46ea35ddc7ff3ace2fc0008ebe351f8f8973bc718e536addca3930 -> cargo-c-0.10.5-funtoo-crates-bundle-f248544fb67315d085c9f63ba42b24bd942a0e8be5a454f6e745ce4da1c0fef791433316459df7b8f29abd4ccf707f6cb6edc40af5d6720a9eb33165aebd545f.tar.gz"

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