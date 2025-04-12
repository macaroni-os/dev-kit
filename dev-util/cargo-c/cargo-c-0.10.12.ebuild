# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/8c5b7af3d6edb6d99f7bffcc94adf550cfee65b3 -> cargo-c-0.10.12-8c5b7af.tar.gz
https://distfiles.macaronios.org/fb/35/96/fb35969577d2b7eeebb57ebc6f296c8eb130838d515da79d7a3d7e4dbb7fa11766b3f358aa385f3625c4a120f92f5ca913d0bd5b7cd63be7c24454e1728c9c70 -> cargo-c-0.10.12-funtoo-crates-bundle-8d3438d3ed7f9f665dcbf4245965a96bb8d45c08b6686e7dbc431e4709e80d183e3c74371f83fbf6a3e3fdf541bfa2f9b6781967ecfd5d2795f7d72e092c397d.tar.gz"

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