# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/b6081a47813aab0175645e332b14282c651c893d -> cargo-c-0.10.5-b6081a4.tar.gz
https://distfiles.macaronios.org/2a/61/4b/2a614bded8163a05679a86428f9a4009ff89a144360417ec5de0b2fc80af5b2d622c293ae523bf1ab982280afbf3bbc44fb01d456d7dd1c8fbc9ec6e5e59977d -> cargo-c-0.10.5-funtoo-crates-bundle-c73c00eb0c38a582144de42fdae4b93dcaf92eaae34e092cc7b616a0b9fe6f6214ebec2c96def6c720c0b73b262afc93299eeb63c40b18438ecc4c537d3a0430.tar.gz"

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