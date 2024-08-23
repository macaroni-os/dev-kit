# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/ee7d7ef74b9c1fa00c6780da41a838752c76b3eb -> cargo-c-0.10.3-ee7d7ef.tar.gz
https://distfiles.macaronios.org/ae/d7/09/aed709f70b8f3569b70373e900a3464d734922d161664c28e16ddb27f10013cc4f9ca8254991b073ff99601268970b2e986e062d04819163fbadea0601281351 -> cargo-c-0.10.3-funtoo-crates-bundle-14082a6b039799364d7b96dd01fc0587486e09d0129992e8fed6cc7c282fcba2b8a3963b1ae9018ade966d9273c7931ca0b12d4ff6436b01fabb383acce20451.tar.gz"

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