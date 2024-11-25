# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/b6081a47813aab0175645e332b14282c651c893d -> cargo-c-0.10.5-b6081a4.tar.gz
https://distfiles.macaronios.org/2c/58/27/2c5827e5a2034724228d8408cb4daad6d681e4d3cdb5bbfa4b48c9ed07237204f0dca0a861e1bc720a280562b79fa183bd91360ef2fae8506011f9d90db3874a -> cargo-c-0.10.5-funtoo-crates-bundle-c43219a9bcb8bfe7675467d8a8e336cdf1e0aa5b16fe548fd608617c056648aacbf46b2d546f2eccf544fea3840201111c2ff297644ee2c96f4b683b284c84c9.tar.gz"

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