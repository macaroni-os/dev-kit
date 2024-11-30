# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/8914ddfa8d45a0c27abdb48708138a5bc32e5bd6 -> cargo-c-0.10.7-8914ddf.tar.gz
https://distfiles.macaronios.org/ab/59/84/ab59843e9abc6e562a984bc4a285457941c574b6c4a8ce2de145563a6e4477ba3d1b873615b9be012cc6069c6afb94365845e3b563753650ebf5ef0d1b27e59c -> cargo-c-0.10.7-funtoo-crates-bundle-9403fc6358b6c157fbd708d4bb77d8c359b7b2f6b1e21956aa264b45927166c6957565901993d9382912b4fe38684da9ff8a4bd1fc242504592f557e0ce0029b.tar.gz"

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