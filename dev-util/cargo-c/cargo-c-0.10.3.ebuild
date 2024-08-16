# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/ee7d7ef74b9c1fa00c6780da41a838752c76b3eb -> cargo-c-0.10.3-ee7d7ef.tar.gz
https://distfiles.macaronios.org/9f/96/f9/9f96f96bc6917edfbd1aa726ae11f78e83878452f122e45b4210dbaf82be946eb4a1d42dde8e237602b58693f4444d76ec9cff42b7161cb302d158dd17b2a24c -> cargo-c-0.10.3-funtoo-crates-bundle-f95aaab9d6517f98038fd0a349fa2389acbb231a656df9403958f6b47b267dac3abe97d18ac1816d6b124c9d98b5e8741c7e9baa809d0fa29465d4efdce1a2f6.tar.gz"

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