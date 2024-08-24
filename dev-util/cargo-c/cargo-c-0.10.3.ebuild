# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/ee7d7ef74b9c1fa00c6780da41a838752c76b3eb -> cargo-c-0.10.3-ee7d7ef.tar.gz
https://distfiles.macaronios.org/f4/9b/ed/f49bed42c91ce23269b91dcd4c992719607a819e4eaffb60c37c09604d877ac0a6af78fb91b8cf25eae3465d64715b3b72398a844832616dcf1d319483572993 -> cargo-c-0.10.3-funtoo-crates-bundle-77b7a0d95b72355128beac6577582465a24cc0a7f1c387fdfad7a210a77e3727b3541461c321ec6dde60aa8cfd4e67cf3d230b690c446fdabd5c73b2bcfd0006.tar.gz"

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