# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/b6081a47813aab0175645e332b14282c651c893d -> cargo-c-0.10.5-b6081a4.tar.gz
https://distfiles.macaronios.org/fd/ac/2e/fdac2e51f3188c03f75dbaf28ccefb1ee6b9225011819250647b7bc4328c7f629494183a228cc63d54860235f43368a0ced56640d05110eceb3b4d8978eaf8a8 -> cargo-c-0.10.5-funtoo-crates-bundle-e3ee9c50a169a9564535893d14b2f92b240460b6a78a303c0fff0f54a43fb7437abfac8951bf6484d9de9b1974ab53a76abec25e6ea9f0d8c170641541eb1d62.tar.gz"

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