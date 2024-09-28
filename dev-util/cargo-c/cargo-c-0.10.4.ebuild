# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/46bd413718501a24afaf60fa36bad799d5e296d6 -> cargo-c-0.10.4-46bd413.tar.gz
https://distfiles.macaronios.org/1b/cc/0f/1bcc0fcc84c2e2a1b3026dadeaae61c0d16b834607c2cc4c014237ea2112beaa11c499ff568550799b694932f160e26449cdaa360c3dacdff781023c428a8017 -> cargo-c-0.10.4-funtoo-crates-bundle-ce4b604ad41aa11f6a5a9ef5fa60a1e5d5b762d85e124a0aa456b3d8072d01fc51101370daf294e2010892d99855ab83c6a98144268f828a21bbe997288395ee.tar.gz"

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