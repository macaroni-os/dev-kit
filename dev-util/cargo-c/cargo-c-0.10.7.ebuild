# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/8914ddfa8d45a0c27abdb48708138a5bc32e5bd6 -> cargo-c-0.10.7-8914ddf.tar.gz
https://distfiles.macaronios.org/28/c6/ad/28c6adce55ba6ed41f9ecc304280dda769b8c379a72b255dffe570627047c31e7f4a45a210eb0e8de29d412166b4ec5c5ec6380d673fb1f9d5cf292dfb62a198 -> cargo-c-0.10.7-funtoo-crates-bundle-97ea6f94fa07b936c6f4e92fce6f2884a780b6effd07c045288013f474804d10aa48ae3117abdadef56bee0dcd94a47fe784c9ae23c3bf4482d622d9ef53ccbf.tar.gz"

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