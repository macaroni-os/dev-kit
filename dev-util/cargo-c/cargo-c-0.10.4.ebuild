# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/46bd413718501a24afaf60fa36bad799d5e296d6 -> cargo-c-0.10.4-46bd413.tar.gz
https://distfiles.macaronios.org/87/ca/e1/87cae1829cab50f2b36c8f0770c0fdcb13d3f6c6ddc04926d8f9fab0ec5e6c2d983057b311445e6ad7477808ec855cfcb2c50daf4b7bc9f3bfe15242e513a1e0 -> cargo-c-0.10.4-funtoo-crates-bundle-b459d8c40e072499678b59114ca1ced553f4c418b03ae0bc2cfdcfe34a03e75d6d883068bdd3b0183f28c7f29a98c621e951f481828f9634c7639392efd8f5a6.tar.gz"

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