# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/ee7d7ef74b9c1fa00c6780da41a838752c76b3eb -> cargo-c-0.10.3-ee7d7ef.tar.gz
https://distfiles.macaronios.org/86/11/b5/8611b5338461c420df575e16b03c05a5beee717d71080d34c7afe04ecba6485731c8225da06acda13ffe62d664a32681d74c3390ad39c1c6ffba7f871817a6cb -> cargo-c-0.10.3-funtoo-crates-bundle-485c1b27b8481ae81453e8bf28f18f3dee78b375d385ad972748e6d7a4c2547e4a67c6d8d41dbee35f1a978fffe340c466d00937145e9b96dbb54abed59baa2a.tar.gz"

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