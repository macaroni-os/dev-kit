# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/46bd413718501a24afaf60fa36bad799d5e296d6 -> cargo-c-0.10.4-46bd413.tar.gz
https://distfiles.macaronios.org/cc/b3/80/ccb3800900e8811a4c5e842d6834e4a0bc33365e07b86a7c06541a43cebc39b5d15e76b38ad23ac8c9424389c181e4501215a91b0b19c8b9137a24d420d6afc0 -> cargo-c-0.10.4-funtoo-crates-bundle-cf87c1168114b51350e4f76f884e9a3778fa6f6fa48a13e9eee7f321afdb37ad98045ef3d924af6307d0641431838c1691db7c38ee42b4e048151c11145eac9d.tar.gz"

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