# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/46bd413718501a24afaf60fa36bad799d5e296d6 -> cargo-c-0.10.4-46bd413.tar.gz
https://distfiles.macaronios.org/9a/dd/ae/9addaefaabe62dca96eadbead2aff0c4f9c0083c8ffca2c22480827a0d58209d55698f4aa642845b017cd867517b41a0eccb29202a9b2ed5394ce867df25101c -> cargo-c-0.10.4-funtoo-crates-bundle-d460b67e0ca23a13761c3e459f46ba493cfd132a239545a763333cffd0682995325b5983e0aa90b34dbcda4e61af836aa2cc80cf2877f0556f73e27340a3090c.tar.gz"

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