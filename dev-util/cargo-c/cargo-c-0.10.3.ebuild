# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/ee7d7ef74b9c1fa00c6780da41a838752c76b3eb -> cargo-c-0.10.3-ee7d7ef.tar.gz
https://distfiles.macaronios.org/c9/e5/ee/c9e5ee90f3e54a3ff2990df802bc92d9b017b2117f86950a5a870ac61a99e5dddfcf3c2e283d9ddd4a899583bc6b5a89ea13347984ca97221b12113812226954 -> cargo-c-0.10.3-funtoo-crates-bundle-06c730fa5228fa5ee2828fbade13cb8e896c507a7d4d0e446f423cb8742e209290ae44165a2818b9b4c9d4005468e238dc8270be6581178cf31e410bbfa3a972.tar.gz"

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