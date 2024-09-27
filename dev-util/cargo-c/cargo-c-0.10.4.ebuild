# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/46bd413718501a24afaf60fa36bad799d5e296d6 -> cargo-c-0.10.4-46bd413.tar.gz
https://distfiles.macaronios.org/d4/96/11/d49611f57524c42796f9eb057b7afaa03f690ec4d7145cc154f1342b424bdc4a33f4da61b3e4898d4dda3fdfc4923d216c8c707c9a61bb9aaa526faf63dc7cf7 -> cargo-c-0.10.4-funtoo-crates-bundle-4e3c5db3adfa6166b91efa31f9fe31970380389f954bb9220fa935ece3ca922c148bbc2d65626547649c98bbdba16bbdbe5f3093460dc940f2333e6154e02c7e.tar.gz"

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