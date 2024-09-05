# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/ee7d7ef74b9c1fa00c6780da41a838752c76b3eb -> cargo-c-0.10.3-ee7d7ef.tar.gz
https://distfiles.macaronios.org/39/5b/a8/395ba8cebf28651d5b612be4773d3a0815ff6e2772aa4e990ba85c1c39746c7c72df51c3ad23a9ebbfb4e0f8f18f542d42d552694648f5734e8d4f9d899a625b -> cargo-c-0.10.3-funtoo-crates-bundle-a4ee48ca5da510e24c723be8040d13a217235da9a49c10ca574c4efbaeed5c1202581dd998c15907ede0e6c963cb6f1455dc9d6dc27bdd1451ba0ef9fe9e70c3.tar.gz"

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