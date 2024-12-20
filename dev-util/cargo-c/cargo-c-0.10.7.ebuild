# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/8914ddfa8d45a0c27abdb48708138a5bc32e5bd6 -> cargo-c-0.10.7-8914ddf.tar.gz
https://distfiles.macaronios.org/e2/ee/41/e2ee4112ae6a2165eb14755c5c06dbdedd24d722c7211090bcd4ba4ce6da9ddb31bf9b88f5f2857cd7772c32058d7fd761a53e3f83a3ae71f37070be65098d9c -> cargo-c-0.10.7-funtoo-crates-bundle-5b29f37af7d0ab8961c4cb4977892443ce5b9efbe2db03b5832a2603bec7b3941513d4627ddcb21e2415ea050c688e4566655830682a5aefe53f0f7619f6a87f.tar.gz"

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