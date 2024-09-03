# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/ee7d7ef74b9c1fa00c6780da41a838752c76b3eb -> cargo-c-0.10.3-ee7d7ef.tar.gz
https://distfiles.macaronios.org/67/4a/d8/674ad8aa3a85086a69835d4d1e4c08bafdc225f38e338c7913b86181e763394993b26aea3eb2a050bd44dc0ca73b13a3daeb9f9d9953d38c05d8943ce202e245 -> cargo-c-0.10.3-funtoo-crates-bundle-a06a88b9fea9caba1911dc79a06b3fc82fcc964980ee04237daeb83cf629c808f65ee1555d3c1baebe1c1ea434bdfa8ea75834ae66651039859e5fff94ba113e.tar.gz"

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