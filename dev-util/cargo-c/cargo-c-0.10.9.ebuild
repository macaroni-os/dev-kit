# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/578b4ed8a8baa9faa42a072ca40b7267b125fc15 -> cargo-c-0.10.9-578b4ed.tar.gz
https://distfiles.macaronios.org/53/06/80/530680cb140836bcb3cf184ce8bd9c841b6047a862656b0195293951ce1185e09ac055ba03a4048d7f4297f2ef5e5cfa08f19fc8479fb7c89e634bafd7b108a7 -> cargo-c-0.10.9-funtoo-crates-bundle-30cb1701030bd1a06c5c0f19e3e04d903e92dad56573485458ef2adac58182fef64171f6f852d17ad8b90a6f88a9ec33948cb584dc7bf6e60738d71a5a538571.tar.gz"

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