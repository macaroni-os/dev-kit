# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/46bd413718501a24afaf60fa36bad799d5e296d6 -> cargo-c-0.10.4-46bd413.tar.gz
https://distfiles.macaronios.org/9b/06/0e/9b060e0bf56224b1c9a20e7985c1bac305d9bd964152785939fb971b4db8be70102c27a0ede84ee6aa47f5ad2f0d6db5590201ba487e4253d76cd947e9c54298 -> cargo-c-0.10.4-funtoo-crates-bundle-e2f3b143f2512762b8f82b84948c2a383dbdd65a960fd11561d7c3df98ebe118d4102244fad2b6c8e9e1b6c68161472e363b25b565f4e5304a3a0aba635240b5.tar.gz"

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