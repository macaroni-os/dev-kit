# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/b6081a47813aab0175645e332b14282c651c893d -> cargo-c-0.10.5-b6081a4.tar.gz
https://distfiles.macaronios.org/6e/c9/69/6ec969554a6490d38dd08744143f54bbf6bf86515289a064ad18f106ba010051eb5cbca6e3f8867a01ea694038085295496f883e34be746f726719a499e5bd7f -> cargo-c-0.10.5-funtoo-crates-bundle-11b481c8001445092eaf2db459b870669a08becfdb0df5c724d7080b72792ebca9352e9e19137227a8f23d3e222a606a57858f98999af38e66f7232b48404845.tar.gz"

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