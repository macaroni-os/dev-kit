# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/578b4ed8a8baa9faa42a072ca40b7267b125fc15 -> cargo-c-0.10.9-578b4ed.tar.gz
https://distfiles.macaronios.org/5a/65/eb/5a65eb2c21e846f91a830c4034bf8b9163b1f464ff6587f1d93c6dc13b4231fdc57c814afc0be281f3c0cb4a1d53195e29a08154599e92fa748008fcf041b182 -> cargo-c-0.10.9-funtoo-crates-bundle-b2a1d61ddb6e2c4415ded50401d3aaf3911ee033e33848abde1b78eb466616548e54eadfa7371b3db6e24a8b9c567bd21c353efc38e1c3b0418056ed87ce4336.tar.gz"

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