# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/46bd413718501a24afaf60fa36bad799d5e296d6 -> cargo-c-0.10.4-46bd413.tar.gz
https://distfiles.macaronios.org/8d/be/cd/8dbecde162edfc6353f359701f6ae669c9be4037ea6b58053a555fe55f02df8710acc43c0bfa28585613135aedfc80008669a32599d82e35c4725ca4a1c8e349 -> cargo-c-0.10.4-funtoo-crates-bundle-000edc157bb4180ea4c351164c129d01ea75885867089ea8ff5c7cccace441f6cad7a8dee1e871d45c521b40db75bd3e660295139cbf7ed310342673847cd628.tar.gz"

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