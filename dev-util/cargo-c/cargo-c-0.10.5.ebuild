# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/b6081a47813aab0175645e332b14282c651c893d -> cargo-c-0.10.5-b6081a4.tar.gz
https://distfiles.macaronios.org/3e/c1/d2/3ec1d2cb6de4de132d0ffeb8b5ef9a36f33fb22236689069c94b5f36bf49ef20b14c9fc1cf1ea0937b8088deec28e7b4bc392a5e87f11a56cc0486951cd566a7 -> cargo-c-0.10.5-funtoo-crates-bundle-fa5fbc2199f6743ac8e5a3ef9e67f9fc8aef40035de54f8136326c064e203e719d50b85762d855b0fbd82bfd370b0320a9f47f09eebcf2802cea6843cbaae605.tar.gz"

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