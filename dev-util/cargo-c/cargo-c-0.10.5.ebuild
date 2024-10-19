# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/b6081a47813aab0175645e332b14282c651c893d -> cargo-c-0.10.5-b6081a4.tar.gz
https://distfiles.macaronios.org/ab/6e/02/ab6e02bff732bbd2178daea7a1d580084bff9ef3595f7d2b38c960bc78ed1106ee9f97624bffcb74d6cd4f84690ea7271aca196e2c8bfb9515b94f17507d28d3 -> cargo-c-0.10.5-funtoo-crates-bundle-94a9d8eee70a67a6caeb403a4e76424bbcd9efe6d0c67883cec1ebbe200cacdcaf9d8b779739e0f62a69d6da9a1cc482db5aa24eb0c47317e3d7ad7218c7fb08.tar.gz"

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