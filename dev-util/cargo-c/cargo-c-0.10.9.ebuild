# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/578b4ed8a8baa9faa42a072ca40b7267b125fc15 -> cargo-c-0.10.9-578b4ed.tar.gz
https://distfiles.macaronios.org/25/99/a5/2599a54c1ebebadce646580f21fec5c681457ceda55e51b3bb9158ec344501e3b4c1668ac389804653bbfbbc3735a1520a3fcf348d13bf82a4849770d2ee3e1b -> cargo-c-0.10.9-funtoo-crates-bundle-8db787451e27de04ad3fc766fed654b73d2c1ce3d926724d813a4c7798ac0439cd3093c579b0227b778f2ba9c48ca8dbbc79e164e90e04e39fa12dee350eb6a5.tar.gz"

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