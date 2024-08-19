# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/ee7d7ef74b9c1fa00c6780da41a838752c76b3eb -> cargo-c-0.10.3-ee7d7ef.tar.gz
https://distfiles.macaronios.org/52/c6/df/52c6dfb068f06cb964fbcc8867451c6b74c59eed0baaf29294f2abfe3050960f9e8a40ecfd6bc07dee5c649e03dfb9c14514d36d20ffaefbac7a3dd2104c4551 -> cargo-c-0.10.3-funtoo-crates-bundle-d4d36ba739038439b53e1e0cea85fef01ccd9cfd5571381224a3d333ed87f599e7236dc187b920cf7dbe65d4955b34324717ac69bee7874b44ce991b66f47cf7.tar.gz"

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