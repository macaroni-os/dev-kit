# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/ee7d7ef74b9c1fa00c6780da41a838752c76b3eb -> cargo-c-0.10.3-ee7d7ef.tar.gz
https://distfiles.macaronios.org/fc/aa/4c/fcaa4c2e0b4d26077d11bab48d870112ee541ab703ed7ce22f4a80f3eaba34e9b336f8cebce345b0adc9b3a4d0601d6d0f7925356b639589cf1ee72b30f1602a -> cargo-c-0.10.3-funtoo-crates-bundle-4f970dd9632d9a7f894223e1ec6336715a4fc721343068feb56e60d0cd7652ff5f04673b2bc321e2c25ad9b21ee56ed131581835138e5782706604ff0851ffe4.tar.gz"

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