# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/ee7d7ef74b9c1fa00c6780da41a838752c76b3eb -> cargo-c-0.10.3-ee7d7ef.tar.gz
https://distfiles.macaronios.org/03/80/28/03802818c658d1c910d119db81eb16ae3943d6d193435c4c8699a0b97a5892bc567f767d132f4522fa5327b0ba3900ee74360412a241635a913c5f9ff376df84 -> cargo-c-0.10.3-funtoo-crates-bundle-f184306e1073b63c57251c846176e8a2bf4386508a4701e13b3b97b386273a52fa774d4f8ff01af1464c1ded27d304e99a396e51a2b4d15bddf4a497e6f6b097.tar.gz"

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