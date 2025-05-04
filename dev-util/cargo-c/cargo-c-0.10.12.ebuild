# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/8c5b7af3d6edb6d99f7bffcc94adf550cfee65b3 -> cargo-c-0.10.12-8c5b7af.tar.gz
https://distfiles.macaronios.org/15/2f/e0/152fe0fea424464874a7e8288b2a4f5f9a18eaf64cde89434c396a21b53cba02112b3c55598cc43fda2158e6605d6653f0ba4b6b97a36a1f1b8940c225b7107f -> cargo-c-0.10.12-funtoo-crates-bundle-1160387cc4c2edeb6bca2e2b5851b562def3b1c968ba3722edf72a8e1238ffefe23a75382991de5f49d39ce0fc41e653c5d59785e6c1c48adef5bbf148436b32.tar.gz"

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