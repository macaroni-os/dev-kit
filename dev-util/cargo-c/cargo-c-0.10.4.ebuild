# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/46bd413718501a24afaf60fa36bad799d5e296d6 -> cargo-c-0.10.4-46bd413.tar.gz
https://distfiles.macaronios.org/50/34/1f/50341fcf8c2b9aad13229b9b3706888329eb0800ba65ad2a55f8547f726201fd12e421bec860fa758c47337b3bd329fd017551d813f8e3e71519dad7c30bd2a6 -> cargo-c-0.10.4-funtoo-crates-bundle-768763a57cc9ba518d27a76fa41cbfa4be9d7d33a2becd2762a2d54b906c693e4e76cd0ec997122867cfe0f2ad7273ca464aa5df370751b5e8ce90819e9b6476.tar.gz"

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