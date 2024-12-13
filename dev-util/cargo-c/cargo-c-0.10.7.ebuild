# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="build and install C-compatible libraries"
HOMEPAGE="https://github.com/lu-zero/cargo-c"
SRC_URI="https://github.com/lu-zero/cargo-c/tarball/8914ddfa8d45a0c27abdb48708138a5bc32e5bd6 -> cargo-c-0.10.7-8914ddf.tar.gz
https://distfiles.macaronios.org/eb/74/1b/eb741b8068b33bee5b7e875946de0d6916a111522d5c47894f0eee24d22146eda85773d2a619e039876ca5ab5f76f5542c72600183fb399734febe4b6c2057b0 -> cargo-c-0.10.7-funtoo-crates-bundle-4cbb14a11936443d42febe4d937236b574d322fda72032e076b64092fbedfb75142f076856c225bda3c84c5d983a20fa6810fee9b0e55e70530c5bd7beb18f0d.tar.gz"

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