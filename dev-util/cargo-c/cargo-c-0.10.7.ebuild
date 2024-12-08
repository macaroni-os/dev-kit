# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/8914ddfa8d45a0c27abdb48708138a5bc32e5bd6 -> cargo-c-0.10.7-8914ddf.tar.gz
https://distfiles.macaronios.org/b6/ff/4e/b6ff4eaed307fd7b5cdc37c0b40a3abb9c48204b7e5d2ed864d1d82574a2369c466d054dea416fc71f1c74e7f788e05aab551f1fd67d11e5eaa6933041974574 -> cargo-c-0.10.7-funtoo-crates-bundle-387aa1870131feebf8e8c9fc0b8467a04c8e298453dba243e98ccbefdbff4f77f3177739d392518edee498cd1af44dd4643c55ffad91eb80ed88d3aef0741b8a.tar.gz"

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