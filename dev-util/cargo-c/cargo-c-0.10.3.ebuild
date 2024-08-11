# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/ee7d7ef74b9c1fa00c6780da41a838752c76b3eb -> cargo-c-0.10.3-ee7d7ef.tar.gz
https://distfiles.macaronios.org/9f/98/2d/9f982db0ee457bc05e00d58c6ab7e543f8a6bf4e2cdfddec0616f932c654c536520f5fc5ca9ffbd2708daeed03d8dc9453c336d7d882d29df6f603ad965f96a6 -> cargo-c-0.10.3-funtoo-crates-bundle-2c8451363fbdd53d554428de9530e4cd91d20072e32c041b8ff2d90b8d19cdafb166179716b98d2d42e53bf0355592162be52b8fa96278685e5865765cead7ff.tar.gz"

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