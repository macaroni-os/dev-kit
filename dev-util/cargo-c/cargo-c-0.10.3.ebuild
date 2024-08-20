# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/ee7d7ef74b9c1fa00c6780da41a838752c76b3eb -> cargo-c-0.10.3-ee7d7ef.tar.gz
https://distfiles.macaronios.org/29/9c/78/299c783ee95de88d8a7e31aaa9c5e00a1eb1e76ad8bbc1215d8eac2536354a45d9cbe7007fa0912a376ef17d4e9af659137abc450a9d7c468bdf4f7a2658bb19 -> cargo-c-0.10.3-funtoo-crates-bundle-4ff7cbe2ce9636dc9cde9f03d988642912dcd2b825ed6c24b8d35ef60d8a9f5b9cd04e4bc34e67c035df9ecd81b68d794e5eff02a24d2903f06764887d0107ae.tar.gz"

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