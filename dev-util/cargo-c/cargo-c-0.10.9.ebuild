# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/578b4ed8a8baa9faa42a072ca40b7267b125fc15 -> cargo-c-0.10.9-578b4ed.tar.gz
https://distfiles.macaronios.org/bf/b0/9a/bfb09ab11e5d8671bf55e8a9cb28f6c7c3274761229c8e71dbdfbd66f780ccda84a89679912df02bcf8ba317109be91d62bf13956a1d3594776ddf35e6f82ca0 -> cargo-c-0.10.9-funtoo-crates-bundle-6210b9398cf64663963910fc99eadf52b28302e08609f4de598217d0e88bdfc39fdc84443fa07b21d7b4a2ab0f3d30301539796b3845b86b797e416cc74415e4.tar.gz"

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