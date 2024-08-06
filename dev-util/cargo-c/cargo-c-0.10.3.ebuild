# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/ee7d7ef74b9c1fa00c6780da41a838752c76b3eb -> cargo-c-0.10.3-ee7d7ef.tar.gz
https://distfiles.macaronios.org/0b/1a/b7/0b1ab72a361899aad5ee277c230e35bafb00d4c17b8c0faf3e9c4f55cddb4bd5a7ca2931e914ec6ed2bf49a39e41a763fedcfce6b58b7dca6780ff4d7f2c9b95 -> cargo-c-0.10.3-funtoo-crates-bundle-3b43a87ca75391ac9d50fa1d4b1dfff44456d148862f5b6b64c028ec68c83c001442fcd4151ee55c9bc30eeca669e97a4a005dc5c64524529e5424b8368c2862.tar.gz"

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