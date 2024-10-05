# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/46bd413718501a24afaf60fa36bad799d5e296d6 -> cargo-c-0.10.4-46bd413.tar.gz
https://distfiles.macaronios.org/d1/67/9b/d1679b7c12f066c3b1208bfd3d9e6d278dee46cab27cce863700038cb6fa5c87d3dd6cbb1bf26309fd809223b69dabe40ae167a3dc04d63d4cb25dd2b90e639d -> cargo-c-0.10.4-funtoo-crates-bundle-94a90f773901f6f17bab94d2368899c8570cf1242e1cd8eab40e834eba42ba4a5f890aedbba539a3ad2ce609b593dfcbe26c2b0e18e1b26efb452ff45b6f412d.tar.gz"

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