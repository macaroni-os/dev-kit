# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/b6081a47813aab0175645e332b14282c651c893d -> cargo-c-0.10.5-b6081a4.tar.gz
https://distfiles.macaronios.org/be/77/74/be7774c89f28f6468a8c7aeb23bc34bb997339cdd78296b3c78a1d0bc4dd8b3219fd5f695b0763008104cd3965eab8200da29b98fb8ac367f52413320323ef84 -> cargo-c-0.10.5-funtoo-crates-bundle-15f5fdc5c0435478e770fd497c60a17370ca6e97c72bfae73e559101b19fecefec91b5c05661fa8b44ba30b1e7faeec942a1a263a3f08bad95f6a5f5842688b9.tar.gz"

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