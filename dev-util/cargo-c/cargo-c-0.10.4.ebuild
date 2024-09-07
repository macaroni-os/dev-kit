# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/46bd413718501a24afaf60fa36bad799d5e296d6 -> cargo-c-0.10.4-46bd413.tar.gz
https://distfiles.macaronios.org/5b/ef/3b/5bef3bba12a8a03c8831961bc24b3e5a4cde5a2a444d585f8eaabf83224a16c0c9c54c0670a031e915225c74290cb590b17ad70dce5d28a932ddd9ed5ea4eacf -> cargo-c-0.10.4-funtoo-crates-bundle-dbe532544f1ec51ffd933e8cf1e7a0d3cb50dd0efe7ea6981a5341199e8d0a9ac04b92d4a3e6f618d5e0840d92646d5713dfb6c5269153894780522d98df98d4.tar.gz"

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