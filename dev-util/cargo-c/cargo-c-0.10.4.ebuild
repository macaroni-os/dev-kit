# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/46bd413718501a24afaf60fa36bad799d5e296d6 -> cargo-c-0.10.4-46bd413.tar.gz
https://distfiles.macaronios.org/bd/e7/a9/bde7a91cb0be12ce39fad5cdc05bfb31a31ab99b68173130a2f26aed5e79d5581a07b72675dabb0f212aa11833a2253c3da6198f5b67bc3aabdc43237d2dea9a -> cargo-c-0.10.4-funtoo-crates-bundle-9f9601bb0ea824e2956a3e46536f1ee2e0448703c42d6b13520953ba8d1a1cf30f1cce5759860c04d8721c28b3c70f189bffe83246f11ee09dbad6c668d3ba0f.tar.gz"

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