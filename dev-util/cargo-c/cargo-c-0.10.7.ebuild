# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/8914ddfa8d45a0c27abdb48708138a5bc32e5bd6 -> cargo-c-0.10.7-8914ddf.tar.gz
https://distfiles.macaronios.org/51/57/67/515767f4970ad988584257056f819fd0a176c0d999a156508187e1eb12bba89bf92984ce7378ecbdd58d27d677d37bf41731d69f93d41804b4a9ee3d7d3e3555 -> cargo-c-0.10.7-funtoo-crates-bundle-388bcfb434c00f059c149478b1afd7fdc1c9e6a22a7369dd97ecd48847421317e229f58641010d013178b7346503c9afb60fd05eac12d6d9f01715213afce08e.tar.gz"

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