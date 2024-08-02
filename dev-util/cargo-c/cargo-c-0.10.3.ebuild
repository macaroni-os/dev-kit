# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/ee7d7ef74b9c1fa00c6780da41a838752c76b3eb -> cargo-c-0.10.3-ee7d7ef.tar.gz
https://distfiles.macaronios.org/8a/8f/99/8a8f99d9b3efeef0f7315d4cabd58b6d81a1e8d0850774f8deb8ba01c88f7ff01954d7d55e1b8b3041544f31687d0159e2880f1d36568a3ae7baab27a7a419a2 -> cargo-c-0.10.3-funtoo-crates-bundle-c5e886f1b31ea65a69aa6a6d807ca1f571634837d0954eb4fe26114771b9abeee3cef40cb1e4fcfac4e873eb0786ad3e555b036954fe29df8c5634aef27a357b.tar.gz"

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