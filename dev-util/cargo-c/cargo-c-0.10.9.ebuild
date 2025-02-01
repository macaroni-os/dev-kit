# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/578b4ed8a8baa9faa42a072ca40b7267b125fc15 -> cargo-c-0.10.9-578b4ed.tar.gz
https://distfiles.macaronios.org/fb/ea/bd/fbeabd8fc83c4e48b034c6bc59e6d56687cd4909df9744f611e5a754efb31052506a8cef18040e97fae8bd2822d16eb318de8eebcf0963c6c0c25755d598662c -> cargo-c-0.10.9-funtoo-crates-bundle-7e8c1cae8ae5f78b50ba608f20326fa6783fde940f2e64fac15753ccfb8e473d4304a2bb278761e9366fd2399bcb647a6aecf39ecc15004cf5694443ce9c175b.tar.gz"

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