# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/8914ddfa8d45a0c27abdb48708138a5bc32e5bd6 -> cargo-c-0.10.7-8914ddf.tar.gz
https://distfiles.macaronios.org/f2/4b/03/f24b038bcbc9d8666f07ef713ec535426cf35b35aae3705754aeb383086a5a7ac31a4424b8dc66bc358ae471ea00aac5a59e73193c8516b29600008a96299305 -> cargo-c-0.10.7-funtoo-crates-bundle-7e0078b975cbb4607e0445c927ace8f791299038aea7efff7abc4b48ced504209f71ed371a46378e2e22262612a676d823e6294abe01bdec76037e433114a0dc.tar.gz"

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