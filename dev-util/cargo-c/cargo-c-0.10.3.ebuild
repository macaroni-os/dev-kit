# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/ee7d7ef74b9c1fa00c6780da41a838752c76b3eb -> cargo-c-0.10.3-ee7d7ef.tar.gz
https://distfiles.macaronios.org/38/c5/f9/38c5f9f5896078315b2281e1f31f1806a2640374f87be0bc61ac45782591aee60fdbd92f81763f116c7f0a6bde1726e323d177b93543832f8c349471bfba425a -> cargo-c-0.10.3-funtoo-crates-bundle-660c98f8c5d31a21ec21f290e8e6dabcbf25ca171e3f616489fe71d5f64c861b6ba410de4da1b235ba09cb41746c9878622784dab0cfdd92a5e65072ab503cb9.tar.gz"

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