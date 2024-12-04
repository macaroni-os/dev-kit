# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/8914ddfa8d45a0c27abdb48708138a5bc32e5bd6 -> cargo-c-0.10.7-8914ddf.tar.gz
https://distfiles.macaronios.org/38/6e/f3/386ef31b07944086bd3f749c1aa104f5f6470e645af52e62d081692ba14486d4b1535c14e9c1fd80c766d3c5516547bad6037e38e0fc993e82e5647f3eacfb96 -> cargo-c-0.10.7-funtoo-crates-bundle-8dcc15989d67eb98324dca48adbaa72962bf1a51304033148d701554a3b4c2dcf7f8853ba01cf5881d157dd5577b15b01757f8941e6d6b42d62e7bfe03d9d418.tar.gz"

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