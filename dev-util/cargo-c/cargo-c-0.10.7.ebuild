# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/8914ddfa8d45a0c27abdb48708138a5bc32e5bd6 -> cargo-c-0.10.7-8914ddf.tar.gz
https://distfiles.macaronios.org/87/32/4c/87324cbf08bb5c8b971ca8bd4bdfe7dd97e732a377d578adc31f5900e8ec0fbd8b6282e80c7d5e21bc7c4868b4ad566c5547de83f72a36332589c6d5641e54d5 -> cargo-c-0.10.7-funtoo-crates-bundle-2cb312fe45778c38b2658b20229fb975c0e3914008e06acfd6f984f5cce9206cac6faac52c0664d8a8aebae5bd923c7bd1a7c4953dbd8fa9dffb82320fbc4a0d.tar.gz"

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