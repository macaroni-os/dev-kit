# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/b6081a47813aab0175645e332b14282c651c893d -> cargo-c-0.10.5-b6081a4.tar.gz
https://distfiles.macaronios.org/d0/33/9d/d0339d35c06be7fc06e451b1c54f41a4d074a51dac4bd656ced0d342804b50683e1f772461ef26e5104980de2f5f1ed8ffc8ea0228a1db3310de8dcb658a6862 -> cargo-c-0.10.5-funtoo-crates-bundle-5969ae1e0cb7d15d729d351e90c261150b621189d12e4ebb5b4df216d5d83d87a01877acc35b2b09fd4df373e10838ebcddd10d5e9f1fb44d18462f8fb4c2226.tar.gz"

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