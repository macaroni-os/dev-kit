# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/ee7d7ef74b9c1fa00c6780da41a838752c76b3eb -> cargo-c-0.10.3-ee7d7ef.tar.gz
https://distfiles.macaronios.org/f7/01/24/f701245d485a56bc244f205f87f20ee08b5cabeac6fe3d7d169f69c14fdf38977313edbdaa747b5f38fd231bda096afb13037ee982f2031482e0bd1f983f29df -> cargo-c-0.10.3-funtoo-crates-bundle-212892701230e9575b0ab676845666fd1925bd3ac023f4b0ac3c15ff4e24edcebd338fba08f0be9bd3d8004d8a3f2b40edf80e245bc9755b34e87803f10f08e1.tar.gz"

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