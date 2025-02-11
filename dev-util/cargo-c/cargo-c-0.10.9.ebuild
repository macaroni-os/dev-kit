# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/578b4ed8a8baa9faa42a072ca40b7267b125fc15 -> cargo-c-0.10.9-578b4ed.tar.gz
https://distfiles.macaronios.org/a1/71/4c/a1714c2f1953455a6a242485a293d8c5ca9dd6ff5e79b6af4f3365c037c7cca154bfecedc5c8cae05bfb68a7af1999de11a688493a9e8c7143c591135fd8e64c -> cargo-c-0.10.9-funtoo-crates-bundle-b2863c39b7b6ce2833aa7f9a21d3ccf4f03d4d6f414e55fc6b4424ff1b38e2528039d9b6271f5a97c03f98dba225cbd07d93d3231f0f320407903d54effd55f0.tar.gz"

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