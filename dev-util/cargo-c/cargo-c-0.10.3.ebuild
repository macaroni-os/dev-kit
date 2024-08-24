# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/ee7d7ef74b9c1fa00c6780da41a838752c76b3eb -> cargo-c-0.10.3-ee7d7ef.tar.gz
https://distfiles.macaronios.org/ba/c8/65/bac8654e4bb039d07477f76b4f0cf53f8fed216d664095c4e8b86da920fb5acb7db679e50ebdf52e8b60525a2311c186a958beda00a7cf28fc1472935512c752 -> cargo-c-0.10.3-funtoo-crates-bundle-325b326e79bfc2c82d318cb709185a3fac8d8a2c11b536da5aa464efbce5f7d1cb0a437d7b1362d611051be32c23c5a2922962a1904b79e7d76723546f185696.tar.gz"

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