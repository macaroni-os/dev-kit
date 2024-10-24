# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/b6081a47813aab0175645e332b14282c651c893d -> cargo-c-0.10.5-b6081a4.tar.gz
https://distfiles.macaronios.org/37/fa/0d/37fa0da2f4b85d9edf7f16921988d5640b17229df0902ff9f95da9c440f798d6b75fe17962cd035a5d79a34c5509970200321a2bf0cde2807e35d037857508bd -> cargo-c-0.10.5-funtoo-crates-bundle-1f68472442bc671bab314840f82045fa68619d64afbd3a65a621f26245f53ee34c9e3f6dc3d19b331fa91c175dcc1ac09c30b26107aed3b23992f09b90fe62ae.tar.gz"

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