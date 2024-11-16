# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/b6081a47813aab0175645e332b14282c651c893d -> cargo-c-0.10.5-b6081a4.tar.gz
https://distfiles.macaronios.org/17/60/86/1760860277dd0a9ccb1923bf5ef3e7755823a87f2578041a1f43573560952e34e41715a204b53532b179cef534afb523062cf515fda8ad067adaeb4cb031b8ff -> cargo-c-0.10.5-funtoo-crates-bundle-492505b3f98a9639bb97f943ad51bb30ddce376a27502872a862705586c6c12011ec0782e3b067685d7556c1601fbc9aa07f03d9aab5d6d7038a38bce6dd703e.tar.gz"

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