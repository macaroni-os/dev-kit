# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/46bd413718501a24afaf60fa36bad799d5e296d6 -> cargo-c-0.10.4-46bd413.tar.gz
https://distfiles.macaronios.org/c9/d1/2f/c9d12fed79d7f4eb7e7dbd372b2069a1b6d7ea86e6abefb2852ef840b3d6822e73434a65a2882bc0777a51ac838762f0614c6c49cca977c15e5aa501a7c9f4bc -> cargo-c-0.10.4-funtoo-crates-bundle-3429dcd945331e1eb81fa61d123a5fd5bd44157bc71d77edffeb1625fb5c3437794d6327e0d5746401eb9d07d6dcb9808198a587dfecd286c12aef8f54fd2650.tar.gz"

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