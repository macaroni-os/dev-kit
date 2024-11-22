# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/b6081a47813aab0175645e332b14282c651c893d -> cargo-c-0.10.5-b6081a4.tar.gz
https://distfiles.macaronios.org/e2/91/38/e2913834bc75a1ac0c3353671161805906a9a6e79503fc76c3985592452021528c082a14f44f337ee9bf8f1753a3636ff23d9eb1fe154ced1aab0feee039f221 -> cargo-c-0.10.5-funtoo-crates-bundle-df8961979904caf30c99a268917a0dd46d895f5d18be57c6b5580d2d008d72a3fd3ce3bef9dc29d1314ac44251031647c4a7a3d6e7af926ef77227085e7b0616.tar.gz"

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