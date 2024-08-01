# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/ee7d7ef74b9c1fa00c6780da41a838752c76b3eb -> cargo-c-0.10.3-ee7d7ef.tar.gz
https://distfiles.macaronios.org/ff/a1/06/ffa10643ba40fd1f13a89beb192cdb93634e3396ada1db91781b15e928cb945ee4d99915e29608439ca50c13505c54a414f15bd97ec24eb4fded0dbe2b0e8096 -> cargo-c-0.10.3-funtoo-crates-bundle-7ffa4a00392e3c26ec3dc44be3b506a84adf26b6cc0091e247d719db6d87b913302fe38c59d4478597c5ae25eb9a80c81b1c2dbe931ab6ff14c3567410a77f69.tar.gz"

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