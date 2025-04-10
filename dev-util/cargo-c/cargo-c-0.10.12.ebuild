# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/8c5b7af3d6edb6d99f7bffcc94adf550cfee65b3 -> cargo-c-0.10.12-8c5b7af.tar.gz
https://distfiles.macaronios.org/36/3c/52/363c5269f4b9e589615fa83798db921c6ec2b46e3920625226239a091b2bd62cf9e3e2c0bf2fc448dadce6ea0ed0a0b04e90809fcb123b53e344d53bc2f5455d -> cargo-c-0.10.12-funtoo-crates-bundle-ae149e7aad60040c238a9cb462368dd5801070f58ecbb19df2ead5ee149320d7895245951cb2607d84e056c31b9067d33ab4e80694fcae79be86bb3e47ee4333.tar.gz"

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