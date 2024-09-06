# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/46bd413718501a24afaf60fa36bad799d5e296d6 -> cargo-c-0.10.4-46bd413.tar.gz
https://distfiles.macaronios.org/bc/63/a9/bc63a9cdf094f3daf5c06c499ed072d547e94059289739db6ec210db553a10651accd12c4032e6fb8cf84a1cc3c93d7feab29b83b23d42fdf6a047232383dae6 -> cargo-c-0.10.4-funtoo-crates-bundle-cc939378792f9574fdd36855c1e1d123da6dc6fcab1f239a5243a60d5b51fbc7e7d1e181028ff23cc275231660b9ec94842c9b3df08047a538dee08ec6e4d848.tar.gz"

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