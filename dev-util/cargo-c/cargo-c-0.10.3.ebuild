# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/ee7d7ef74b9c1fa00c6780da41a838752c76b3eb -> cargo-c-0.10.3-ee7d7ef.tar.gz
https://distfiles.macaronios.org/48/1b/c1/481bc1432238015b1f54e59ba499cb3945e6d907185508bb8313f9303c757be977a88c47680d8466bbdbb3bb567b592c6c88809d500717090255f976ccd068d0 -> cargo-c-0.10.3-funtoo-crates-bundle-60f560409e4f02e2b24fc71892d8200692c0920a4f3ce50db4df61ccfaec3fe06c0c26899f2649c47b3830cf66b5e797e5f10be6bd0b2cbcb9946a4619bf14f4.tar.gz"

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