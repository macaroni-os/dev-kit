# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/b6081a47813aab0175645e332b14282c651c893d -> cargo-c-0.10.5-b6081a4.tar.gz
https://distfiles.macaronios.org/8c/7c/6f/8c7c6f56230fba6d12d100dc9890ce9352c5121fcd9ad498d156cf38d5163454c60b6f07acce180019620422cb100bf1b823e716113d299c7ce626fdddf694a1 -> cargo-c-0.10.5-funtoo-crates-bundle-deffe781171790463e49c2074150bea8b137126202bb5ba59c5c353feab5afac4812f597239ec246a1dadd0500f4551c407cc230ee54c335c9c48f0892d946e3.tar.gz"

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