# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/ee7d7ef74b9c1fa00c6780da41a838752c76b3eb -> cargo-c-0.10.3-ee7d7ef.tar.gz
https://distfiles.macaronios.org/fd/f3/8d/fdf38d6a5b656c6dde4ce889afc5d34506110c6fc6570cd11f95db207939c99d110531228864d299752f8469b51a1c99a0bf1581cc8c5e519dd06d54f71e63ab -> cargo-c-0.10.3-funtoo-crates-bundle-6fcc2bee81e70cf17ab3b11ce3454e189a8572585ac14fe7401d112802ef7f348b79259c73af43fe78557cffdaaaf6565e60b3b3255bc886719d0e05c789e855.tar.gz"

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